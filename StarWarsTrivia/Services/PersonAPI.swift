//
//  PersonAPI.swift
//  StarWarsTrivia
//
//  Created by Joshua Madrigal on 9/28/18.
//  Copyright © 2018 Joshua Madrigal. All rights reserved.
//

import Foundation

class PersonAPI {
    
    func getRandomPersonURLSession(completion: @escaping PersonResponseCompletion) {
        
        guard let url = URL(string: PERSON_URL) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                debugPrint(error.debugDescription)
                completion(nil)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let jsonAny = try JSONSerialization.jsonObject(with: data, options: [])
                guard let json = jsonAny as? [String: Any] else { return }
                let person = self.parsePersonManual(json: json)
                completion(person)
                
            } catch {
                debugPrint(error.localizedDescription)
            }
            
            print("Data = \(data)")
            print("Response = \(response)")
            
        }
        task.resume()
        
    } // end getRandomPersonURLSession func
    
    private func parsePersonManual(json: [String: Any]) -> Person {
        let name = json["name"] as? String ?? "No Name"
        let height = json["height"] as? String ?? "No Height"
        let mass = json["mass"] as? String ?? "No mass"
        let hair = json["hair_color"] as? String ?? "No hair"
        let birthYear = json["birth_year"] as? String ?? "No year"
        let gender = json["gender"] as? String ?? "No gender"
        let homeWorldUrl = json["homeworld"] as? String ?? "no world"
        let filmUrls = json["films"] as? [String] ?? [String]()
        let vehicleUrls = json["vehicles"] as? [String] ?? [String]()
        let starshipUrls = json["starships"] as? [String] ?? [String]()
        
        return Person(name: name, height: height, mass: mass, hair: hair, birthYear: birthYear, gender: gender, homeWorldUrl: homeWorldUrl, fileUrls: filmUrls, vehicleUrls: vehicleUrls, starshipUrls: starshipUrls)
        
    } // end parsePersonManual func
    
    
} // end PersonAPI class
