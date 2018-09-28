//
//  SelectPersonVC.swift
//  StarWarsTrivia
//
//  Created by Joshua Madrigal on 9/26/18.
//  Copyright © 2018 Joshua Madrigal. All rights reserved.
//

import UIKit

class SelectPersonVC: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var massLbl: UILabel!
    @IBOutlet weak var hairLbl: UILabel!
    @IBOutlet weak var birthYearLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    
    var personAPI = PersonAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        personAPI.getRandomPersonURLSession()
        
    }


}

