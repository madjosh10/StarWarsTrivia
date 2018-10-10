//
//  BlackBgView.swift
//  StarWarsTrivia
//
//  Created by Joshua Madrigal on 9/26/18.
//  Copyright © 2018 Joshua Madrigal. All rights reserved.
//

import UIKit

class BlackBgView: UIView {
    override func awakeFromNib() {
        layer.backgroundColor = BLACK_BG
        layer.cornerRadius = 10
    }
    
    
}

class BlackBgButton: UIButton {
    
    override func awakeFromNib() {
        layer.backgroundColor = BLACK_BG
        layer.cornerRadius = 10
    }
    
}
