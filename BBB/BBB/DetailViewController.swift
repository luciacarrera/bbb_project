//
//  DetailViewController.swift
//  BBB
//
//  Created by user928865 on 11/7/21.
//  Copyright © 2021 Lucia Carrera Saenz. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController{
    
    @IBOutlet var nameField: UILabel!
    @IBOutlet var addressField: UITextField!
    @IBOutlet var descriptionField: UITextField!
    @IBOutlet var bestField: UITextField!
    @IBOutlet var priceField: UITextField!
    @IBOutlet var drinksField: UITextField!
    @IBOutlet var musicField: UITextField!
    @IBOutlet var dancingField: UITextField!
    @IBOutlet var friendlinessField: UITextField!
    
    
    
    var item: Item!
    
    // Use address/slider formatters?
    // put categories in best for?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameField.text = item.name
        addressField.text = item.address
        descriptionField.text = item.description
        bestField.text = item.bestFor
        priceField.text = String(item.priceR)
        drinksField.text = String(item.drinksR)
        musicField.text = String(item.musicR)
        dancingField.text = String(item.dancingR)
        friendlinessField.text = String(item.friendlyR)
        
    }
}
