//
//  DetailViewController.swift
//  BBB
//
//  Created by user928865 on 11/7/21.
//  Copyright © 2021 Lucia Carrera Saenz. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate{
        
    @IBOutlet var nameField: UILabel!
    @IBOutlet var addressField: UITextField!
    @IBOutlet var descriptionField: UITextField!
    @IBOutlet var bestField: UITextField!
    @IBOutlet var priceField: UISlider!
    @IBOutlet var drinksField: UISlider!
    @IBOutlet var musicField: UISlider!
    @IBOutlet var dancingField: UISlider!
    @IBOutlet var friendlinessField: UISlider!
    
    
    
    var item: Item!
    
    // Use address/slider formatters?
    // put categories in best for?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameField.text = item.name
        addressField.text = item.address
        descriptionField.text = item.description
        bestField.text = item.bestFor
        priceField.value = Float(item.priceR)
        drinksField.value = Float(item.drinksR)
        musicField.value = Float(item.musicR)
        dancingField.value = Float(item.dancingR)
        friendlinessField.value = Float(item.friendlyR)
        
    }
    
    override func viewWillDisappear(_ animated: Bool){
        super.viewWillDisappear(animated)
        
        
        // "Save" changes to item
        item.name = nameField.text ?? ""
        item.address = addressField.text ?? ""
        item.description = descriptionField.text ?? ""
        item.bestFor = bestField.text ?? ""
        item.priceR = priceField.value
        item.drinksR = drinksField.value
        item.dancingR = dancingField.value
        item.friendlyR = friendlinessField.value
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}
