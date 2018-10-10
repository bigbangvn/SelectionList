//
//  LanguageListViewController.swift
//  CountryListExample
//
//  Created by BangNguyen on 7/10/18.
//  Copyright © 2018 BangNguyen. All rights reserved.
//

import UIKit

class LanguageListViewController: BaseSelectionListViewController<LanguageCell, Language> {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        items = Languages.loadList()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Language"
    }

}
