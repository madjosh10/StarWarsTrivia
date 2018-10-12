//
//  VehicleAPI.swift
//  StarWarsTrivia
//
//  Created by Joshua Madrigal on 10/11/18.
//  Copyright © 2018 Joshua Madrigal. All rights reserved.
//

import Foundation
import Alamofire
class VehicleAPI {
    
    func getVehicle(url: String, completion: @escaping VehicleResponseCompletion) {
        guard let url = URL(string: url) else { return }
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = response.data else { return completion(nil)}
            let jsonDecoder = JSONDecoder()
            do {
                let vehicle = try jsonDecoder.decode(Vehicle.self, from: data)
                completion(vehicle)
                
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
            
        }
        
        
    }
}
