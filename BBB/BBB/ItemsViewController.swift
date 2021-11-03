//
//  File.swift
//  BBB
//
//  Created by Lucia Carrera Saenz on 11/2/21.
//  Copyright © 2021 Lucia Carrera Saenz. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    
    var itemStore: ItemStore!
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // creates instance of uitableviewcell with default appearance
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
        
        // sets text on cell with description of item
        // that is at the nth index of items where n= row
        // this cell will apeear in on the table view
        let item = itemStore.allItems[indexPath.row]
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "\(item.totalR)"
        
        return cell
    }
}


