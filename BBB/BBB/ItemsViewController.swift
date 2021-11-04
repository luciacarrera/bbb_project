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
    
    @IBAction func addNewItem(_ sender: UIButton) {
        
    }
    
    @IBAction func toggleEditingMode(_ sender: UIButton) {
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get a new or recycle cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        // sets text on cell with description of item
        // that is at the nth index of items where n= row
        // this cell will apeear in on the table view
        let item = itemStore.allItems[indexPath.row]
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "\(item.type)"
        
        return cell
    }
}


