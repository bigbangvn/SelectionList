//
//  Languages.swift
//  CountryListExample
//
//  Created by BangNguyen on 7/10/18.
//  Copyright © 2018 BangNguyen. All rights reserved.
//

import UIKit

class Languages {
    public static func loadList() -> [Language] {
        let allLocales = NSLocale.availableLocaleIdentifiers
        let enLocale = NSLocale(localeIdentifier: "en_US")
        var list = [Language]()
        for i in 0..<allLocales.count {
            let localeId = allLocales[i]
            //let locale = NSLocale(localeIdentifier: localeId)
            let name = enLocale.displayName(forKey: NSLocale.Key.identifier , value: localeId) ?? ""
            list.append(Language(localeId: localeId, name: name))
            //print("\(allLocales[i]): \(name)")
        }
        return list
    }
}
