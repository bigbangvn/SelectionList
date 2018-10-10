//
//  BaseSelectionListViewController.swift
//  CountryListExample
//
//  Created by BangNguyen on 7/10/18.
//  Copyright © 2018 Juan Pablo Fernandez. All rights reserved.
//

import UIKit

protocol SelectionItem {
    var name: String { get }
}

class SelectionCell<ItemType: SelectionItem>: UITableViewCell {
    var item: ItemType?
}

class BaseSelectionListViewController<CellType: SelectionCell<ItemType>, ItemType: SelectionItem>: UIViewController, UISearchResultsUpdating, UITableViewDelegate, UITableViewDataSource {
    
    var kCellIdentifier = "Cell"
    var tableView: UITableView!
    var searchController: UISearchController?
    var filteredItems = [ItemType]()
    var items: [ItemType] = []
    
    var selectCallback: ((_ selectedItem: ItemType) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        tableView = UITableView(frame: view.frame)
        tableView.register(CellType.self, forCellReuseIdentifier: kCellIdentifier)
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.clear
        
        self.view.addSubview(tableView)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(handleCancel))
        
        setUpSearchBar()
    }

    private func setUpSearchBar() {
        self.searchController = UISearchController(searchResultsController: nil)
        self.tableView.tableHeaderView = searchController?.searchBar
        self.searchController?.hidesNavigationBarDuringPresentation = false
        
        //        self.searchController?.searchBar.backgroundImage = UIImage()
        self.searchController?.dimsBackgroundDuringPresentation = false
        //        self.searchController?.searchBar.barTintColor = UIColor.white
        self.searchController?.searchBar.placeholder = "Search"
        //        self.searchController?.searchBar.tintColor = Constants.Colors.mainColor
        //        self.searchController?.searchBar.backgroundColor = UIColor.white
        self.searchController?.searchResultsUpdater = self
    }
    
    @objc func handleCancel() {
        self.dismiss(animated: true, completion: nil)
    }
    
    public func updateSearchResults(for searchController: UISearchController) {
        filteredItems.removeAll()
        let text = searchController.searchBar.text!.lowercased()
        for item in items {
            if item.name.lowercased().contains(text) {
                filteredItems.append(item)
            }
        }
        tableView.reloadData()
    }
    
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! CellType

        self.searchController?.isActive = false
        selectCallback?(cell.item!)
        
        tableView.deselectRow(at: indexPath, animated: true)
        self.tableView.reloadData()
        self.dismiss(animated: true, completion: nil)
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController!.isActive && searchController!.searchBar.text != "" {
            return filteredItems.count
        }
        
        return items.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellIdentifier, for: indexPath as IndexPath) as! CellType
        
        if searchController!.isActive && searchController!.searchBar.text != "" {
            cell.item = filteredItems[indexPath.row]
            return cell
        }
        
        cell.item = items[indexPath.row]
        return cell
    }
}
