//
//  CountryCell.swift
//  CountryListExample
//
//  Created by Juan Pablo on 9/8/17.
//  Copyright © 2017 Juan Pablo Fernandez. All rights reserved.
//

import UIKit

class CountryCell: SelectionCell<Country> {
    
    var nameLabel: UILabel?
    var extensionLabel: UILabel?
    var showFlag = true
    var showPhoneExt = false
    
    override var item: Country? {
        didSet {
            if let name = item?.name {
                nameLabel?.text = (showFlag ? ((item?.flag ?? "") + " ") : "") + "\(name)"
                extensionLabel?.text = showPhoneExt ? "+\(item!.phoneExtension)" : nil
            }
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func prepareForReuse() {
        self.nameLabel?.text = ""
        self.extensionLabel?.text = ""
    }
    
    func setup() {
        
        nameLabel = UILabel()
        nameLabel?.textColor = UIColor.black
        nameLabel?.font = UIFont.systemFont(ofSize: 20)
        nameLabel?.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameLabel!)
        
        nameLabel?.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        nameLabel?.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        
        extensionLabel = UILabel()
        extensionLabel?.textColor = UIColor.gray
        extensionLabel?.font = UIFont.systemFont(ofSize: 18)
        extensionLabel?.translatesAutoresizingMaskIntoConstraints = false
        addSubview(extensionLabel!)
        extensionLabel?.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        extensionLabel?.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15).isActive = true
    }
}
