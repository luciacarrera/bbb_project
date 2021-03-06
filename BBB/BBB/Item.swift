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
    var totalR: Double // average of all stars?
    var priceR: Double
    var drinksR: Double
    var musicR: Double
    var dancingR: Double
    var friendlyR: Double
    /* INITIALIZER */
    init(name: String, type: String, address: String, bestFor: String, description: String,  priceR: Double, drinksR: Double, musicR: Double, dancingR: Double, friendlyR: Double){
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
        let total = (priceR + drinksR + musicR + dancingR + friendlyR ) / 5.0
        self.totalR = round(total * 10) / 10.0

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
            
            self.init(name: randomName,
                      type: establishmentType,
                      address: randomAddy,
                      bestFor: randomBestFor,
                      description: des,
                      priceR: 0,
                      drinksR: 0,
                      musicR: 0,
                      dancingR: 0,
                      friendlyR: 0)
            
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
