//
//  Item.swift
//  BBB
//
//  Created by Lucia Carrera Saenz on 11/2/21.
//  Copyright © 2021 Lucia Carrera Saenz. All rights reserved.
//

import UIKit

// clas with all things that will be included for each establishment
class Item {

    // basic information
    var name: String
    var address: String
    var bestFor: String // category. may choose from list?
    var description: String
    var photo: UIImage //important
    let dateCreated: Date // not included in draft but should add?

    
    // ratings, will need to make from min 0 to 5, so converts to stars
    var totalR: Int // average of all stars?
    var priceR: Int
    var drinksR: Int
    var musicR: Int
    var dancingR: Int
    var friendlyR: Int
    let ratings = 5 // all ratings excluding totalR

        
    init(name: String, address: String, bestFor: String, description: String, photo:UIImage, totalR: Int, priceR: Int, drinksR: Int, musicR: Int, dancingR: Int, friendlyR: Int, dateCreated: Date){
        //basic info
        self.name = name
        self.address = address
        self.bestFor = bestFor
        self.description = description
        self.photo = photo
        self.dateCreated = Date()
        
        // ratings
        self.priceR = priceR
        self.drinksR = drinksR
        self.musicR = musicR
        self.dancingR = dancingR
        self.friendlyR = friendlyR
        
        // get average of ratings
        self.totalR = (priceR + drinksR + musicR + dancingR + friendlyR ) / ratings
        

    }
    
    convenience init(random: Bool = false) {
        if random {
            let places = ["Ake's","Lincoln's", "FOAM"]
            let randomName = places.randomElement()!
            let categories = ["Dancing","First Date","Watching Sports"]
            
        }
        <#statements#>
    }
    
}
