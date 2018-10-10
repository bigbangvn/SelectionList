//
//  ViewController.swift
//  CountryListExample
//
//  Created by Juan Pablo on 9/8/17.
//  Copyright © 2017 Juan Pablo Fernandez. All rights reserved.
//

import UIKit
//import CountryList

class ViewController: UIViewController {
    @IBOutlet weak var selectedCountryLabel: UILabel!
    @IBOutlet weak var selectedLanguageLabel: UILabel!
    
    @IBAction func handleCountryList(_ sender: Any) {
        let vc = CountryList()
        vc.selectCallback = {[weak self] (item: Country) in
            self?.didSelectCountry(country: item)
        }
        let navController = UINavigationController(rootViewController: vc)
        self.present(navController, animated: true, completion: nil)
    }
    
    @IBAction func handleLanguageList(_ sender: Any) {
        let vc = LanguageListViewController()
        vc.selectCallback = {[weak self] item in
            self?.selectedLanguageLabel.text = item.name
        }
        let navController = UINavigationController(rootViewController: vc)
        self.present(navController, animated: true, completion: nil)
    }
    
    func didSelectCountry(country: Country) {
        self.selectedCountryLabel.text = "\(country.flag!) \(country.name), \(country.countryCode), \(country.phoneExtension)"
    }
}

