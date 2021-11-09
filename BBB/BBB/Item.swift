//
//  Item.swift
//  BBB
//
//  Created by Lucia Carrera Saenz on 11/2/21.
//  Copyright © 2021 Lucia Carrera Saenz. All rights reserved.
//

import UIKit

// clas with all things that will be included for each establishment
class Item: Equatable, Codable {
    
    /* ITEM PROPERTIES */
    // basic information
    var name: String
    var type: String
    var address: String
    var bestFor: String // category. may choose from list?
    var description: String
    
    // var photo: UIImage
    let dateCreated: Date // not included in draft but should add?
    
    // ratings, will need to make from min 0 to 5, so converts to stars
    var totalR: Float // average of all stars?
    var priceR: Float
    var drinksR: Float
    var musicR: Float
    var dancingR: Float
    var friendlyR: Float
    let ratings = 5.0 // all ratings excluding totalR
    
    
    /* INITIALIZER */
    init(name: String, type: String, address: String, bestFor: String, description: String,  priceR: Float, drinksR: Float, musicR: Float, dancingR: Float, friendlyR: Float){
        //basic info
        self.name = name
        self.type = type
        self.address = address
        self.bestFor = bestFor
        self.description = description
        //self.photo = photo removed because i didnt know how to do it
        self.dateCreated = Date()
        
        // ratings
        self.priceR = priceR
        self.drinksR = drinksR
        self.musicR = musicR
        self.dancingR = dancingR
        self.friendlyR = friendlyR
        
        // get average of ratings
        self.totalR = (priceR + drinksR + musicR + dancingR + friendlyR ) / Float(ratings)

    }
    
    /* CONVENIENCE INITIALIZER */
    convenience init(random: Bool = false) {
        if random {
            let randomIndex = Int.random(in: 0..<3)

            // name
            let places = ["Ake's Place", "Three Needs", "FOAM Brewers"]
            let randomName = places[randomIndex]
            
            // establishment type
            let establishmentType = "Bar"
            
            // address
            let addy = ["134 Church St. Burlington VT, 05401","185 Pearl St. Burlington VT, 05401", "12 Lake St. Burlington VT, 05401"]
            let randomAddy = addy[randomIndex]
            
            // best for
            let categories = ["Dancing", "First Date", "Watching Sports"]
            let randomBestFor = categories.randomElement()!
            
            // description
            let des = "lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum "
            
            // photo
            //let photo = UIImage.init()
            
            self.init(name: randomName, type: establishmentType, address: randomAddy, bestFor: randomBestFor, description: des,  priceR: Float.random(in:0...5), drinksR: Float.random(in:0...5), musicR: Float.random(in:0...5), dancingR: Float.random(in:0...5), friendlyR: Float.random(in:0...5))
            
        } else {
            self.init(name: "", type: "", address: "", bestFor: "", description: "", priceR: 0, drinksR: 0, musicR: 0, dancingR: 0, friendlyR: 0)
        }
    }
    
    static func ==(lhs: Item, rhs: Item) -> Bool {
        return lhs.name == rhs.name
        && lhs.type == rhs.type
        && lhs.address == rhs.address
    }
    
}
