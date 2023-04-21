//
//  Celestial.swift
//  SeeSky
//
//  Created by Marco Di Bernardo on 20/04/23.
//

import Foundation
import UIKit




class Celestial: Decodable, Hashable {
    
    var name: String
    ///Technical data
    var type: String
    var average_distance_from_earth: String
    var mass: String
    var equatorial_radius: String
    var composition: String
    var orbital_period: String
    var average_orbital_speed: String
    
    var image: UIImage
    var isFavorite: Bool
    
    var desc: String
    
    init(name: String, type:String, average_distance_from_earth: String, mass: String, equatorial_radius: String, composition: String, orbital_period: String, average_orbital_speed: String, image: UIImage, isFavorite: Bool, desc: String) {
        self.name = name
        self.type = type
        self.average_distance_from_earth = average_distance_from_earth
        self.mass = mass
        self.equatorial_radius = equatorial_radius
        self.composition = composition
        self.orbital_period = orbital_period
        self.average_orbital_speed = average_orbital_speed
        self.image = image
        self.isFavorite = isFavorite
        self.desc = desc
    }
    
    enum CodingKeays: String, CodingKey{
        
        case name
        case type
        case average_distance_from_earth
        case mass
        case equatorial_radius
        case composition
        case orbital_period
        case average_orbital_speed
        case image
        case isFavorite
        case desc
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    static func == (lhs: Celestial, rhs: Celestial) -> Bool {
        if lhs.name == rhs.name &&
            lhs.type == rhs.type &&
            lhs.average_distance_from_earth == rhs.average_distance_from_earth &&
            lhs.mass == rhs.mass &&
            lhs.equatorial_radius == rhs.equatorial_radius &&
            lhs.composition == rhs.composition &&
            lhs.orbital_period == rhs.orbital_period &&
            lhs.average_orbital_speed == rhs.average_orbital_speed &&
            lhs.image == rhs.image &&
            lhs.isFavorite == rhs.isFavorite &&
            lhs.desc == rhs.desc
        {
            return true
        } else {
            return false
        }
    }
    
}


let categories = ["Constellation", "Planets", "Satellites", "Stars", "Galaxies", "Meteores", "Star System"]

///Function that retrieves Celestials with isFavorite flag ON
func getFavorites(_ list: [Celestial]) -> [Celestial] {
    
    
    var result : [Celestial] = []
    var decoded : [Celestial] = []
    
    guard let url = Bundle.main.url(forResource: "Celestials", withExtension: "json") else {
        fatalError("File not found")
    }
    
    //reads data
    let data = try! Data(contentsOf: url)
    let decoder = JSONDecoder()
    decoded = try! decoder.decode([Celestial].self, from: data)
    
    
    for i in decoded {
        if i.isFavorite {
            result.append(i)
        }
    }
    
    
    return result
    
}

///Function to retrieve data according to type of Celestial
func getListType( _ type: String) -> [Celestial]{
    
    var result : [Celestial] = []
    var decoded : [Celestial] = []
    
    guard let url = Bundle.main.url(forResource: "Celestials", withExtension: "json") else {
        fatalError("File not found")
    }
    
    //reads data
    let data = try! Data(contentsOf: url)
    let decoder = JSONDecoder()
    decoded = try! decoder.decode([Celestial].self, from: data)
    
    
    for i in decoded {
        if i.type.uppercased() == type.uppercased() {
            result.append(i)
        }
    }
    
    return result
}
