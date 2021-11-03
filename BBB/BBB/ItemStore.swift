//
//  ItemStore.swift
//  BBB
//
//  Created by Lucia Carrera Saenz on 11/2/21.
//  Copyright © 2021 Lucia Carrera Saenz. All rights reserved.
//

import UIKit

class ItemStore {
    
    // List of items stored
    var allItems = [Item]()
    
    /* CREATE ITEM FUNCTION */
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
    
    /* INITIALIZER */
    init(){
        for _ in 0..<5 {
            createItem()
        }
    }
}


