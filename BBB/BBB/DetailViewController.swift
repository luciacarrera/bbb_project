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
    @IBOutlet var descriptionField: UITextView!
    @IBOutlet var bestField: UITextField!
    @IBOutlet var priceField: UISlider!
    @IBOutlet var drinksField: UISlider!
    @IBOutlet var musicField: UISlider!
    @IBOutlet var dancingField: UISlider!
    @IBOutlet var friendlinessField: UISlider!
    var itemStore: ItemStore!
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func choosePhotoSource(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { _ in
            print("Present camera")
        }
        alertController.addAction(cameraAction)
        
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default){_ in
            print("Present photo library")
        }
        alertController.addAction(photoLibraryAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    @IBAction func deleteItem(_ sender: UIBarButtonItem) {
        
        let itemToDelete = nameField.text ?? ""
        
        let alertController = UIAlertController(title: nil, message: "Are you sure you want to delete \(itemToDelete)?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Yes", style: .destructive){
            _ in
            // erase item
            self.itemStore.removeItem(self.item)
            // go back to main view
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc: UIViewController = storyboard.instantiateViewController(withIdentifier: "ItemsViewController") 
            self.present(vc, animated: true, completion: nil)
            
            
            
        }
        alertController.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true) // completion: nil?
        
           
    }
    var item: Item! {
        didSet {
            navigationItem.title = item.name
        }
    }
   
    
    
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
    
    override func viewDidLoad() {
        let borderColor : UIColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        descriptionField.layer.borderWidth = 1.5
        descriptionField.layer.borderColor = borderColor.cgColor
        descriptionField.layer.cornerRadius = 5.0
    }
    
}
