//
//  ButtonExtension.swift
//  Test Project
//
//  Created by Bincy Jain on 01/10/21.
//

import UIKit

extension UIButton {
    func setCardViewButtonGrayWithBorder(button : UIButton){
//        button.layer.cornerRadius = 10.0
//        //button.layer.shadowColor = UIColor.gray.cgColor
//        button.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
//        //button.layer.shadowRadius = 12.0
//        button.layer.borderColor = UIColor.lightGray.cgColor
//        button.layer.borderWidth = 0.5
//        button.layer.shadowOpacity = 0.7
        
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.lightGray.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        button.layer.shadowOpacity = 0.2
        button.layer.shadowRadius = 2.0
        button.layer.borderWidth = 0.1
        button.layer.borderColor = UIColor.lightGray.cgColor
        //button.layer.masksToBounds = false
        
    }
    
    func setCardViewButtonWithBorder(button : UIButton){
//        button.layer.cornerRadius = 10.0
//        //button.layer.shadowColor = UIColor.gray.cgColor
//        button.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
//        //button.layer.shadowRadius = 12.0
//        button.layer.borderColor = UIColor.lightGray.cgColor
//        button.layer.borderWidth = 0.5
//        button.layer.shadowOpacity = 0.7
        
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.lightGray.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        button.layer.shadowOpacity = 0.2
        button.layer.shadowRadius = 2.0
        button.layer.borderWidth = 0.2
        button.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    
}

extension UIImageView {
    func setCardViewGrayWithoutBorder(view : UIImageView){
        view.layer.cornerRadius = 10.0
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        view.layer.shadowRadius = 2.0
        view.layer.shadowOpacity = 0.2
    }
    
    func setCardViewRoundWithoutBorder(view : UIImageView){
        
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        view.layer.shadowRadius = 12.0
        view.layer.shadowOpacity = 0.7
        view.layer.masksToBounds = true
    }
    
    func roundCornerForImageView(_ corners:UIRectCorner,_ cormerMask:CACornerMask, radius: CGFloat) {
        if #available(iOS 11.0, *){
            self.clipsToBounds = true
            self.layer.cornerRadius = radius
            self.layer.maskedCorners = cormerMask
        }else{
            let rectShape = CAShapeLayer()
            rectShape.bounds = self.frame
            rectShape.position = self.center
            rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
            self.layer.mask = rectShape
        }
    }
}

