//
//  Starship.swift
//  StarWarsTrivia
//
//  Created by Joshua Madrigal on 10/12/18.
//  Copyright © 2018 Joshua Madrigal. All rights reserved.
//

import Foundation

struct Starship : Codable {
    let name: String
    let model: String
    let make: String
    let cost: String
    let length: String
    let speed: String
    let crew: String
    let passengers: String
    let capacity: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case model
        case make = "manufacturer"
        case cost = "cost_in_credits"
        case length
        case speed = "max_atmosphering_speed"
        case crew
        case passengers
        case capacity = "cargo_capacity"
        
    }
    
} // end of Starhsip Struct
