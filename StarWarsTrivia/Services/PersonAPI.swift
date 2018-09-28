//
//  PersonAPI.swift
//  StarWarsTrivia
//
//  Created by Joshua Madrigal on 9/28/18.
//  Copyright © 2018 Joshua Madrigal. All rights reserved.
//

import Foundation

class PersonAPI {
    
    
    func getRandomPersonURLSession() {
        
        guard let url = URL(string: PERSON_URL) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                debugPrint(error.debugDescription)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let jsonAny = try JSONSerialization.jsonObject(with: data, options: [])
                guard let json = jsonAny as? [String: Any] else { return }
                print(json)
            } catch {
                debugPrint(error.localizedDescription)
            }
            
            print("Data = \(data)")
            print("Response = \(response)")
            
        }
        task.resume()
        
    } // end getRandomPersonURLSession func
    
    
} // end PersonAPI class
