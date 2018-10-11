//
//  HomeworldVC.swift
//  StarWarsTrivia
//
//  Created by Joshua Madrigal on 10/10/18.
//  Copyright © 2018 Joshua Madrigal. All rights reserved.
//

import UIKit

class HomeworldVC: UIViewController, PersonProtocol {
    
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var populationLbl: UILabel!
    @IBOutlet weak var terrainLbl: UILabel!
    @IBOutlet weak var climateLbl: UILabel!
    
    var person: Person!
    let api = HomeworldAPI()

    override func viewDidLoad() {
        super.viewDidLoad()
        print(person.name)
        api.getHomeWorld(url: person.homeWorldUrl) { (homeworld) in
            if let homeworld = homeworld {
                self.setUpUi(homeworld: homeworld)
            }
        }
        // Do any additional setup after loading the view.
    } // end viewDidLoad
    
    func setUpUi(homeworld: Homeworld) {
        nameLbl.text = homeworld.name
        climateLbl.text = homeworld.climate
        terrainLbl.text = homeworld.terrain
        populationLbl.text = homeworld.population
        
    }
    

}
