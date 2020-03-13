//
//  TextField+Extensions.swift
//  C0773839_MidTerm_MAD3115W2020
//
//  Created by Prakash on 2020-03-07.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import UIKit

extension UITextField{
    
    func animateToColor(selectedColor: UIColor) {
        let color = CABasicAnimation(keyPath: "borderColor")
        
        color.fromValue = self.layer.borderColor
        
        color.toValue = selectedColor
        
        color.duration = 0.7
        color.repeatCount = 1

        self.layer.borderColor =  selectedColor.cgColor
        
        if selectedColor == UIColor.black{
            self.layer.borderWidth = 0.0
        }
        else{
            self.layer.borderWidth = 1.0
        }
        
        self.layer.add(color, forKey: "borderColor")
    }
    
    func animateVisibility( hidden: Bool) {
        UIView.transition(with: self, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.isHidden = hidden
        })
    }
}
