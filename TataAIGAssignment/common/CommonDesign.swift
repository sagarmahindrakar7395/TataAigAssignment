//
//  CommonDesign.swift
//  TataAIGAssignment
//
//  Created by Sagar Mahindrakar on 27/04/21.
//

import Foundation
import UIKit

extension UIView{
    
    func applybackgroundShadow(){
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowColor = UIColor(red:0, green:0, blue:0, alpha:0.1).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 6
        layer.masksToBounds = false
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
}
