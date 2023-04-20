//
//  Celestial.swift
//  SeeSky
//
//  Created by Marco Di Bernardo on 20/04/23.
//

import Foundation
import UIKit




class Celestial {
    var name: String
    var image: UIImage
    var description: String
    var technical: String
    var isFavorite: Bool
    
    init(name: String, image: UIImage, description: String, technical: String, isFavorite: Bool) {
        self.name = name
        self.image = image
        self.description = description
        self.technical = technical
        self.isFavorite = isFavorite
    }
}

///Function that retrieves Celestials with isFavorite flag ON
func getFavorites(_ list: [Celestial]) -> [Celestial] {
    
    var result: [Celestial] = []
    
    for i in list {
        if i.isFavorite {
            result.append(i)
        }
    }
    
    return result
    
}
