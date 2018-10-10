//
//  FadeEnabledButton.swift
//  StarWarsTrivia
//
//  Created by Joshua Madrigal on 10/8/18.
//  Copyright © 2018 Joshua Madrigal. All rights reserved.
//

import UIKit

class FadeEnabledButton : UIButton {
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                UIView.animate(withDuration: 0.2) {
                    self.alpha = 1.0
                }
            } else {
                UIView.animate(withDuration: 0.2) {
                    self.alpha = 0.6
                }
            }
        }
    }
    
}
