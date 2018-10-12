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
        print(person.name)
        vehicles = person.vehicleUrls
        guard let firstVehicle = vehicles.first else { return }
        getVehicle(url: firstVehicle)
        // Do any additional setup after loading the view.
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
    }
    
    @IBAction func nextClicked(_ sender: Any) {
    }
    
    

} // end VehiclesVC class
