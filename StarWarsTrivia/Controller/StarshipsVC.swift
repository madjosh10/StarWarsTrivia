//
//  StarshipsVC.swift
//  StarWarsTrivia
//
//  Created by Joshua Madrigal on 10/10/18.
//  Copyright © 2018 Joshua Madrigal. All rights reserved.
//

import UIKit

class StarshipsVC: UIViewController, PersonProtocol {
    
    var person: Person!
    let api = StarshipAPI()
    var starships = [String]()
    var currentStarship = 0
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var makeLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var lengthLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var crewLbl: UILabel!
    @IBOutlet weak var passengersLbl: UILabel!
    @IBOutlet weak var capacityLbl: UILabel!
    // buttons outlets
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        starships = person.starshipUrls
        nextBtn.isEnabled = starships.count > 1
        previousBtn.isEnabled = false
        guard let firstStarship = starships.first else {return}
        getStarship(url: firstStarship)
        
    } // end viewDidload()
    
    func getStarship(url: String) {
        api.getStarship(url: url) { (starship) in
            if let starship = starship {
                self.setUpView(starship: starship)
            }
        }
        
    } // end getStarship()
    
    
    func setUpView(starship: Starship) {
        nameLbl.text = starship.name
        modelLbl.text = starship.model
        makeLbl.text = starship.make
        costLbl.text = starship.cost
        lengthLbl.text = starship.length
        speedLbl.text = starship.speed
        crewLbl.text = starship.crew
        passengersLbl.text = starship.passengers
        capacityLbl.text = starship.capacity
        
    } // end setUpView()
    
    @IBAction func previousClicked(_ sender: Any) {
        currentStarship -= 1
        setButtonState()
    }
    
    
    @IBAction func nextClicked(_ sender: Any) {
        currentStarship += 1
        setButtonState()
    }
    
    func setButtonState() {
        nextBtn.isEnabled = currentStarship == starships.count - 1 ? false : true
        previousBtn.isEnabled = currentStarship == 0 ? false : true
        
        getStarship(url: starships[currentStarship])
        
    }
    

} // end StarshipsVC Class
