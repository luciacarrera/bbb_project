//
//  DetailViewController.swift
//  BBB
//
//  Created by user928865 on 11/7/21.
//  Copyright © 2021 Lucia Carrera Saenz. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController{
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var addressField: UITextField!
    @IBOutlet var bestforField: UITextField!
    @IBOutlet var priceField: UISlider!
    @IBOutlet var drinksField: UISlider!
    @IBOutlet var musicField: UISlider!
    @IBOutlet var dancingField: UISlider!
    @IBOutlet var friendlyField: UISlider!
    @IBOutlet var descField: UITextField!
    
    var item: Item!
    
    // Use address/slider formatters?
    // put categories in best for?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameField.text = item.name
        addressField.text = item.address
        bestforField.text = item.bestFor
        priceField.value = Float(item.priceR)
        drinksField.value = Float(item.drinksR)
        musicField.value = Float(item.musicR)
        dancingField.value = Float(item.dancingR)
        friendlyField.value = Float(item.friendlyR)
        descField.text = item.description
        
        
    }
}
