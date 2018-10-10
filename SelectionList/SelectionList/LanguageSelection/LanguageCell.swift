//
//  LanguageCell.swift
//  SelectionList
//
//  Created by BangNguyen on 8/10/18.
//  Copyright © 2018 BangNguyen. All rights reserved.
//

import UIKit

class LanguageCell: SelectionCell<Language> {

    override var item: Language? {
        didSet {
            textLabel?.text = item?.name
        }
    }

}
