//
//  Vehicle.swift
//  StarWarsTrivia
//
//  Created by Joshua Madrigal on 10/11/18.
//  Copyright © 2018 Joshua Madrigal. All rights reserved.
//

import Foundation

struct Vehicle : Codable {
    let name: String
    let model: String
    let manufacturer: String
    let cost: String
    let length: String
    let speed: String
    let crew: String
    let passengers: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case model
        case manufacturer
        case cost = "cost_in_credits"
        case length
        case speed = "max_atmosphering_speed"
        case crew
        case passengers
        
    }
    
} // end of Vehicle Struct
