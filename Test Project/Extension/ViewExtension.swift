//
//  ViewExtension.swift
//  Test Project
//
//  Created by Bincy Jain on 01/10/21.
//

import UIKit

extension UIView {
    func roundCorners(_ corners:UIRectCorner,_ cormerMask:CACornerMask, radius: CGFloat) {
        if #available(iOS 11.0, *){
            self.clipsToBounds = false
            self.layer.cornerRadius = radius
            self.layer.maskedCorners = cormerMask
        }else{
            let rectShape = CAShapeLayer()
            rectShape.bounds = self.frame
            rectShape.position = self.center
            rectShape.path = UIBezierPath(roundedRect: self.bounds,    byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
            self.layer.mask = rectShape
        }
    }
    
    func setCardViewGrayWithBorder(view : UIView){
        view.layer.cornerRadius = 10.0
        //button.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        //button.layer.shadowRadius = 12.0
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 0.5
        view.layer.shadowOpacity = 0.2
    }
    
//    func setCardViewGrayWithBorder1(view : UIView){
//        view.layer.cornerRadius = 10.0
//        //button.layer.shadowColor = UIColor.gray.cgColor
//        view.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
//        //button.layer.shadowRadius = 12.0
//        view.layer.borderColor = UIColor.lightGray.cgColor
//        view.layer.borderWidth = 0.5
//        view.layer.shadowOpacity = 0.2
//    }
    
    func setCardViewGrayWithoutBorder(view : UIView){
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        view.layer.shadowRadius = 2.0
        view.layer.shadowOpacity = 0.2
    }
    
    func setCard(width: CGFloat, height: CGFloat, cornerRadius: CGFloat, image: UIImageView) {
        let outerView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        outerView.clipsToBounds = false
        outerView.layer.shadowColor = UIColor.black.cgColor
        outerView.layer.shadowOpacity = 1
        outerView.layer.shadowOffset = CGSize.zero
        outerView.layer.shadowRadius = 10
        outerView.layer.shadowPath = UIBezierPath(roundedRect: outerView.bounds, cornerRadius: cornerRadius).cgPath
        outerView.addSubview(image)
    }
}

class DropShadowView: UIView {
    var presetCornerRadius : CGFloat = 5.0
    
    /*
     once the bounds of the drop shadow view (container view) is initialized,
     the bounds variable value will be set/updated and the
     setupShadow method will run
     */
    override var bounds: CGRect {
        didSet {
            //setupShadowPath()
        }
    }
    
    private func setupShadowPath() {
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: presetCornerRadius).cgPath
        
        // further optimization by rasterizing the container view and its shadow into bitmap instead of dynamically rendering it every time
        // take note that the rasterized bitmap will be saved into memory and it might take quite some memory if you have many cells
        
        // self.layer.shouldRasterize = true
        // self.layer.rasterizationScale = UIScreen.main.scale
    }

}


extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
