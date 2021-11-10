//
//  DetailViewController.swift
//  BBB
//
//  Created by user928865 on 11/7/21.
//  Copyright © 2021 Lucia Carrera Saenz. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate{
    

    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var addressField: UITextField!
    @IBOutlet var bestField: UITextField!

    @IBOutlet var drinksField: UISlider!
    @IBOutlet var musicField: UISlider!
    @IBOutlet var dancingField: UISlider!
    @IBOutlet var friendlinessField: UISlider!
    
    @IBOutlet var priceRating: UILabel!
    @IBOutlet var priceStarButtons: [UIButton]!
    
    var itemStore: ItemStore!
    
    @IBAction func priceStarTapped(_ sender: UIButton) {
        let tag = sender.tag
        for button in priceStarButtons {
            if button.tag <= tag {
                // select button
                button.setTitle("★", for: .normal)
            } else {
                // not selected button
                button.setTitle("☆", for: .normal)
            }
        }
        
        priceRating.text = String(tag)
    }
    
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
        
        let okAction = UIAlertAction(title: "Yes", style: .destructive){_ in
            // erase item
            self.itemStore.removeItem(self.item)
            // go back to main view
            self.navigationController!.popViewController(animated: true)
        }
        alertController.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true) // completion: nil
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
        bestField.text = item.bestFor
        priceRating.text = String(item.priceR)
        
        for i in 0..<Int(item.priceR) {
            priceStarButtons[i].setTitle("★", for: .normal)
        }
        
//        priceField.value = Float(item.priceR)
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
        item.bestFor = bestField.text ?? ""
        item.priceR = Double(priceRating.text ?? "") ?? 0.0
//        item.drinksR = Int(drinksField.value)
//        item.dancingR = Int(dancingField.value)
//        item.friendlyR = Int(friendlinessField.value)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
