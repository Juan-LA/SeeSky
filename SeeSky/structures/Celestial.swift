//
//  Celestial.swift
//  SeeSky
//
//  Created by Marco Di Bernardo on 20/04/23.
//

import Foundation
import UIKit
import Kingfisher

///Class for test purposes
//class IDS : Decodable {
//    var id: String
//    var englishName: String
//
//    init(id: String, englishName: String) {
//        self.id = id
//        self.englishName = englishName
//    }
//
//    enum CodingKeys: String, CodingKey
//    {
//        case id
//        case englishName
//    }
//}


class Celestial: Decodable, Hashable {

    var id: String
    var englishName: String
    var aphelion: Int
    var gravity: Double
    var equaRadius: Double
    var bodyType: String
    
    init(id: String, name: String, maxDistFromSun: Int, gravity: Double, equaRadius: Double, bodyType: String) {
        self.id = id
        self.englishName = name
        self.aphelion = maxDistFromSun
        self.gravity = gravity
        self.equaRadius = equaRadius
        self.bodyType = bodyType
    }
    
    
    
    

    enum CodingKeays: String, CodingKey{

        case id
        case englishName
        case aphelion
        case gravity
        case equaRadius
        case bodyType
        
        
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(englishName)
    }

    static func == (lhs: Celestial, rhs: Celestial) -> Bool {
        if lhs.id == rhs.id &&
            lhs.englishName == rhs.englishName &&
            lhs.aphelion == rhs.aphelion &&
            lhs.gravity == rhs.gravity &&
            lhs.equaRadius == rhs.equaRadius &&
            lhs.bodyType == rhs.bodyType
        {
            return true
        } else {
            return false
        }
    }
    
    
    
    

}
let defaultCelestial = Celestial(id: "", name: "", maxDistFromSun: 0, gravity: 0.0, equaRadius: 0, bodyType: "")

let categories = ["Star", "Planet" , "Dwarf Planet", "Asteroid", "Comet", "Moon"]

let celestials = getBodies()
///Function that retrieves Celestials with isFavorite flag ON
//func getFavorites() -> [Celestial] {
//
//
//    var result : [Celestial] = []
//    var decoded : [Celestial] = []
//
//    guard let url = Bundle.main.url(forResource: "Celestials", withExtension: "json") else {
//        fatalError("File not found")
//    }
//
//    //reads data
//    let data = try! Data(contentsOf: url)
//    let decoder = JSONDecoder()
//    decoded = try! decoder.decode([Celestial].self, from: data)
//
//
//    for i in decoded {
//        if i.isFavorite {
//            result.append(i)
//        }
//    }
//
//
//    return result
//
//}

///Function that collects all Celestial that are inside the OTD section
//func getOTD() -> [Celestial] {
//
//
//    var result : [Celestial] = []
//    var decoded : [Celestial] = []
//
//    guard let url = Bundle.main.url(forResource: "Celestials", withExtension: "json") else {
//        fatalError("File not found")
//    }
//
//    //reads data
//    let data = try! Data(contentsOf: url)
//    let decoder = JSONDecoder()
//    decoded = try! decoder.decode([Celestial].self, from: data)
//
//
//    for i in decoded {
//        if i.isOTD {
//            result.append(i)
//        }
//    }
//
//
//    return result
//
//}

///Function to retrieve all Celestials
//func getAllCelestial() -> [Celestial]{
//
//
//
//
//    return result
//}


///Function to retrieve data according to type of Celestial
//func getListType( _ type: String) -> [Celestial]{
//
//    var result : [Celestial] = []
//    var decoded : [Celestial] = []
//
//    guard let url = Bundle.main.url(forResource: "Celestials", withExtension: "json") else {
//        fatalError("File not found")
//    }
//
//    //reads data
//    let data = try! Data(contentsOf: url)
//    let decoder = JSONDecoder()
//    decoded = try! decoder.decode([Celestial].self, from: data)
//
//
//    for i in decoded {
//        if type.uppercased().contains(i.type.uppercased()) {
//            result.append(i)
//        }
//    }
//
//    return result
//}

/////Function that collects all the first images of each category
//func getFirstElemCategories() -> [Celestial] {
//    var result : [Celestial] = []
//
//    for cat in categories {
//        var temp = getListType(cat)
//        if !temp.isEmpty {
//            result.append(temp[0])
//        } else {
//            result.append(Celestial(id: <#T##String#>, name: <#T##String#>, moons: <#T##[String]#>, maxDistFromSun: <#T##Int#>, mass: <#T##Mass#>, vol: <#T##Volume#>, gravity: <#T##Double#>, equaRadius: <#T##Int#>, type: <#T##String#>))
//        }
//
//    }
//
//    return result
//}



///Retrieve data by specific category
func getBodiesByCategory(_ list: [Celestial], _ category: String) -> [Celestial]{
    var result : [Celestial] = []
    
    for elem in list {
        if elem.bodyType.uppercased() == category.uppercased(){
            result.append(elem)
        }
    }
    
    for elem in result{
        print(elem.englishName)
    }
   
    
    return result
}




func getBodies() -> [Celestial]{
    
    var result : [Celestial] = []
    
    guard let url = Bundle.main.url(forResource: "ListBodies", withExtension: "json") else {
        fatalError("File JSON non trovato")
    }

    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let object = try decoder.decode([String:[Celestial]].self, from: data)
        // Usa l'oggetto "object" come desideri
        print(object)
        result = object["bodies"]!
    } catch {
        print("Errore nella lettura del file JSON: \(error.localizedDescription)")
    }
    
    return result
}

///function to get images categories
func getImgCat() -> [String]{
    var result : [String] = []
    
    guard let url = Bundle.main.url(forResource: "ListImgUrl", withExtension: "json") else {
        fatalError("File JSON non trovato")
    }

    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let object = try decoder.decode([String].self, from: data)
        // Usa l'oggetto "object" come desideri
        print(object)
        result = object
    } catch {
        print("Errore nella lettura del file JSON: \(error.localizedDescription)")
    }
    
    return result
}


///Function to retrieve 3 different elements to show inside the OTD section
func get3ElemRandom(_ list: [Celestial]) -> [Celestial]{
    var result : [Celestial] = []
    var temp : Celestial
    
    while result.count != 3 {
        var exists = false
        temp = list[Int.random(in: 0...list.count)]
        for i in 0..<result.count {
            if temp == result[i]{
                exists = true
                break
            }
        }
        if exists == false {
            result.append(temp)
        }
    }
    
    
    
    return result
}
