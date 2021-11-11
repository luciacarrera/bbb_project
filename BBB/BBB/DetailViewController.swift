//
//  DetailViewController.swift
//  BBB
//
//  Created by user928865 on 11/7/21.
//  Copyright © 2021 Lucia Carrera Saenz. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate{
    
    var itemStore: ItemStore!
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var addressField: UITextField!
    @IBOutlet var bestField: UITextField!
    
    @IBOutlet var priceRating: UILabel!
    @IBOutlet var priceStarButtons: [UIButton]!
    
    @IBOutlet var drinksRating: UILabel!
    @IBOutlet var drinksStarButtons: [UIButton]!
    
    @IBOutlet var musicRating: UILabel!
    @IBOutlet var musicStarButtons: [UIButton]!
    
    @IBOutlet var dancingRating: UILabel!
    @IBOutlet var dancingStarButtons: [UIButton]!
    
    @IBOutlet var friendlinessRating: UILabel!
    @IBOutlet var friendlinessStarButtons: [UIButton]!
    
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
    
    @IBAction func drinksStarTapped(_ sender: UIButton) {
        let tag = sender.tag
        for button in drinksStarButtons {
            if button.tag <= tag {
                // select button
                button.setTitle("★", for: .normal)
            } else {
                // not selected button
                button.setTitle("☆", for: .normal)
            }
        }
        drinksRating.text = String(tag)
    }
    
    @IBAction func musicStarTapped(_ sender: UIButton) {
        let tag = sender.tag
        for button in musicStarButtons {
            if button.tag <= tag {
                // select button
                button.setTitle("★", for: .normal)
            } else {
                // not selected button
                button.setTitle("☆", for: .normal)
            }
        }
        musicRating.text = String(tag)
    }
    
    @IBAction func dancingStarTapped(_ sender: UIButton) {
        let tag = sender.tag
        for button in dancingStarButtons {
            if button.tag <= tag {
                // select button
                button.setTitle("★", for: .normal)
            } else {
                // not selected button
                button.setTitle("☆", for: .normal)
            }
        }
        dancingRating.text = String(tag)
    }
    
    @IBAction func friendlinessButtonTapped(_ sender: UIButton) {
        let tag = sender.tag
        for button in friendlinessStarButtons {
            if button.tag <= tag {
                // select button
                button.setTitle("★", for: .normal)
            } else {
                // not selected button
                button.setTitle("☆", for: .normal)
            }
        }
        friendlinessRating.text = String(tag)
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
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameField.text = item.name
        addressField.text = item.address
        bestField.text = item.bestFor
        
        for i in 0..<Int(item.priceR) {
            priceStarButtons[i].setTitle("★", for: .normal)
        }
        
        for i in 0..<Int(item.drinksR) {
            drinksStarButtons[i].setTitle("★", for: .normal)
        }
        
        for i in 0..<Int(item.musicR) {
            musicStarButtons[i].setTitle("★", for: .normal)
        }
        
        for i in 0..<Int(item.dancingR) {
            dancingStarButtons[i].setTitle("★", for: .normal)
        }
        
        for i in 0..<Int(item.friendlyR) {
            friendlinessStarButtons[i].setTitle("★", for: .normal)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool){
        super.viewWillDisappear(animated)
        
        // "Save" changes to item
        item.name = nameField.text ?? ""
        item.address = addressField.text ?? ""
        item.bestFor = bestField.text ?? ""
        item.priceR = Double(priceRating.text ?? "") ?? 0.0
        item.drinksR = Double(drinksRating.text ?? "") ?? 0.0
        item.musicR = Double(musicRating.text ?? "") ?? 0.0
        item.dancingR = Double(dancingRating.text ?? "") ?? 0.0
        item.friendlyR = Double(friendlinessRating.text ?? "") ?? 0.0
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
