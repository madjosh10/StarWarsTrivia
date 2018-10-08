//
//  SelectPersonVC.swift
//  StarWarsTrivia
//
//  Created by Joshua Madrigal on 9/26/18.
//  Copyright © 2018 Joshua Madrigal. All rights reserved.
//

import UIKit

class SelectPersonVC: UIViewController {

    // outlets for person information
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var massLbl: UILabel!
    @IBOutlet weak var hairLbl: UILabel!
    @IBOutlet weak var birthYearLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    // outlet for 4 buttons
    @IBOutlet weak var filmsBtn: UIButton!
    @IBOutlet weak var starshipsBtn: UIButton!
    @IBOutlet weak var vehiclesBtn: UIButton!
    @IBOutlet weak var homeWorldBtn: UIButton!
    
    var personAPI = PersonAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // step 1: make networkin request
    }

    @IBAction func randomClicked(_ sender: Any) {
        let random = Int.random(in: 1 ... 87)
        personAPI.getRandomPersonAlamo(id: random) { (person) in
            if let person = person {
                self.setUpView(person: person)
            }
        }
        
    }
    
    func setUpView(person: Person) {
        nameLbl.text = person.name
        heightLbl.text = person.height
        massLbl.text = person.mass
        hairLbl.text = person.hair
        birthYearLbl.text = person.birthYear
        genderLbl.text = person.gender
        
        homeWorldBtn.isEnabled = !person.homeWorldUrl.isEmpty
        vehiclesBtn.isEnabled = !person.vehicleUrls.isEmpty
        starshipsBtn.isEnabled = !person.starshipUrls.isEmpty
        filmsBtn.isEnabled = !person.filmUrls.isEmpty
        
        
    }
    
    
    @IBAction func homeWorldClicked(_ sender: Any) {
        
    }
    
    @IBAction func vehiclesClicked(_ sender: Any) {
    }
    
    @IBAction func starshipsClicked(_ sender: Any) {
    }
    
    @IBAction func filmsClicked(_ sender: Any) {
    }
}

