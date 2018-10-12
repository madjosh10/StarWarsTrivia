//
//  VehiclesVC.swift
//  StarWarsTrivia
//
//  Created by Joshua Madrigal on 10/10/18.
//  Copyright © 2018 Joshua Madrigal. All rights reserved.
//

import UIKit

class VehiclesVC: UIViewController, PersonProtocol {
    
    var person: Person!
    let api = VehicleAPI()
    var vehicles = [String]()
    var currentVehicle = 0

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var makeLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var lengthLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var crewLbl: UILabel!
    @IBOutlet weak var passengersLbl: UILabel!
    // buttons outlets
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        vehicles = person.vehicleUrls
        nextBtn.isEnabled = vehicles.count > 1
        previousBtn.isEnabled = false
        guard let firstVehicle = vehicles.first else { return }
        getVehicle(url: firstVehicle)
        
    }
    
    func getVehicle(url: String) {
        api.getVehicle(url: url) { (vehicle) in
            if let vehicle = vehicle {
                self.setUpView(vehicle: vehicle)
            }
        }
    }
    
    func setUpView(vehicle: Vehicle) {
        nameLbl.text = vehicle.name
        modelLbl.text = vehicle.model
        makeLbl.text = vehicle.manufacturer
        costLbl.text = vehicle.cost
        lengthLbl.text = vehicle.length
        speedLbl.text = vehicle.speed
        crewLbl.text = vehicle.crew
        passengersLbl.text = vehicle.passengers
        
    }
    
    
    @IBAction func previousClicked(_ sender: Any) {
        currentVehicle -= 1
        setButtonState()
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        currentVehicle += 1
        setButtonState()
    }
    
    func setButtonState() {
        
        nextBtn.isEnabled = currentVehicle == vehicles.count - 1 ? false : true
        previousBtn.isEnabled = currentVehicle == 0 ? false : true
        
//        if currentVehicle == 0 {
//            previousBtn.isEnabled = false
//
//        } else {
//            previousBtn.isEnabled = true
//
//        }
//
//        if currentVehicle == vehicles.count - 1 {
//            nextBtn.isEnabled = false
//
//        } else {
//            nextBtn.isEnabled = true
//
//        }
        
        getVehicle(url: vehicles[currentVehicle])
        
        
    }
    
    

} // end VehiclesVC class
