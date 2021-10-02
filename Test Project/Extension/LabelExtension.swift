//
//  LabelExtension.swift
//  Test Project
//
//  Created by Bincy Jain on 01/10/21.
//

import UIKit


class UnderlinedLabel: UILabel {

override var text: String? {
    didSet {
        guard let text = text else { return }
        let textRange = NSRange(location: 0, length: text.count)
        let attributedText = NSMutableAttributedString(string: text)
        attributedText.addAttribute(.underlineStyle,
                                    value: NSUnderlineStyle.single.rawValue,
                                    range: textRange)
        // Add other attributes if needed
        self.attributedText = attributedText
        }
    }
}


extension NSMutableAttributedString {
    @discardableResult func bold(_ text:String) -> NSMutableAttributedString {
        
        let attrs : [NSAttributedString.Key : Any] = [
            //NSAttributedString.Key.font : UIFont(name: "Montserrat-Bold", size: 12)!,
            NSAttributedString.Key.foregroundColor : UIColor.darkGray,
            NSAttributedString.Key.underlineStyle : NSUnderlineStyle.single.rawValue]
        let boldString = NSMutableAttributedString(string: text, attributes: attrs)
        self.append(boldString)
        return self
    }
    
    @discardableResult func normal(_ text:String)->NSMutableAttributedString {
        let attrs : [NSAttributedString.Key : Any] = [
            //NSAttributedString.Key.font : UIFont(name: "Montserrat-Regular", size: 12)!,
            NSAttributedString.Key.foregroundColor : UIColor.lightGray
        ]
        let normal =  NSAttributedString(string: text,  attributes:attrs)
        self.append(normal)
        return self
    }
}
