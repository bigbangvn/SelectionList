//
//  CountryListTableViewController.swift
//  CountryListExample
//
//  Created by Juan Pablo on 9/8/17.
//  Copyright © 2017 Juan Pablo Fernandez. All rights reserved.
//

import UIKit

class CountryList: BaseSelectionListViewController<CountryCell, Country> {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        items = Countries.countries
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Country List"
    }
    
}
