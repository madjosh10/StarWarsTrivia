//
//  SelectPersonVC.swift
//  StarWarsTrivia
//
//  Created by Joshua Madrigal on 9/26/18.
//  Copyright © 2018 Joshua Madrigal. All rights reserved.
//

import UIKit

class SelectPersonVC: UIViewController {

    var personAPI = PersonAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        personAPI.getRandomPersonURLSession()
        
    }


}

