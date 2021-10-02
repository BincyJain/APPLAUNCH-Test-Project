//
//  SearchBarExtension.swift
//  Test Project
//
//  Created by Bincy Jain on 01/10/21.
//

import UIKit

extension UISearchBar {
    
    func getTextField() -> UITextField? {
            if #available(iOS 13.0, *) {
                return self.searchTextField
            } else {
                // Fallback on earlier versions
                let textField = subviews.first(where: { $0 is UITextField }) as? UITextField
                return textField
            }
        }
//    func setTextField(color: UIColor) {
//        guard let textField = getTextField() else { return }
//        switch searchBarStyle {
//        case .minimal:
//            textField.layer.backgroundColor = color.cgColor
//            textField.layer.cornerRadius = 6
//        case .prominent, .default: textField.backgroundColor = color
//        @unknown default: break
//        }
//    }
    
    private var textField: UITextField? {
        let subViews = self.subviews.flatMap { $0.subviews }
        if #available(iOS 13, *) {
            if let _subViews = subViews.last?.subviews {
                return (_subViews.filter { $0 is UITextField }).first as? UITextField
            }else{
                return nil
            }
        } else {
            return (subViews.filter { $0 is UITextField }).first as? UITextField
        }
    }
    
    public var activityIndicator: UIActivityIndicatorView? {
        return textField?.leftView?.subviews.compactMap{ $0 as? UIActivityIndicatorView }.first
    }
    
    private var searchIcon: UIImage? {
        let subViews = subviews.flatMap { $0.subviews }
        return  ((subViews.filter { $0 is UIImageView }).first as? UIImageView)?.image
    }
    
    var isLoading: Bool {
        get {
            return activityIndicator != nil
        } set {
            if newValue {
                if activityIndicator == nil {
                    let _activityIndicator = UIActivityIndicatorView(style: .gray)
                    _activityIndicator.color = UIColor.gray
                    _activityIndicator.startAnimating()
                    _activityIndicator.backgroundColor = textField?.backgroundColor ?? UIColor.white
                    textField?.leftView?.addSubview(_activityIndicator)
                    let leftViewSize = textField?.leftView?.frame.size ?? CGSize.zero
                    _activityIndicator.center = CGPoint(x: leftViewSize.width/2, y: leftViewSize.height/2)
                }
            } else {
                activityIndicator?.removeFromSuperview()
            }
        }
    }
    
    
    
    
}

class SearchBar: UISearchBar {

    private enum SubviewKey: String {
        case searchField, clearButton, cancelButton,  placeholderLabel
    }

    // Button/Icon images
    public var clearButtonImage: UIImage?
    public var resultsButtonImage: UIImage?
    public var searchImage: UIImage?

    // Button/Icon colors
    public var searchIconColor: UIColor?
    public var clearButtonColor: UIColor?
    public var cancelButtonColor: UIColor?
    public var capabilityButtonColor: UIColor?

    // Text
    public var textColor: UIColor?
    public var placeholderColor: UIColor?
    public var cancelTitle: String?

    // Cancel button to change the appearance.
    public var cancelButton: UIButton? {
        guard showsCancelButton else { return nil }
        return self.value(forKey: SubviewKey.cancelButton.rawValue) as? UIButton
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        if let cancelColor = cancelButtonColor {
            self.cancelButton?.setTitleColor(cancelColor, for: .normal)
        }
        if let cancelTitle = cancelTitle {
            self.cancelButton?.setTitle(cancelTitle, for: .normal)
        }

        guard let textField = self.value(forKey: SubviewKey.searchField.rawValue) as? UITextField else { return }

        if let clearButton = textField.value(forKey: SubviewKey.clearButton.rawValue) as? UIButton {
            update(button: clearButton, image: clearButtonImage, color: clearButtonColor)
        }
        if let resultsButton = textField.rightView as? UIButton {
            update(button: resultsButton, image: resultsButtonImage, color: capabilityButtonColor)
        }
        if let searchView = textField.leftView as? UIImageView {
            searchView.image = (searchImage ?? searchView.image)?.withRenderingMode(.alwaysTemplate)
            if let color = searchIconColor {
                searchView.tintColor = color
            }
        }
        if let placeholderLabel =  textField.value(forKey: SubviewKey.placeholderLabel.rawValue) as? UILabel,
            let color = placeholderColor {
            placeholderLabel.textColor = color
        }
        if let textColor = textColor  {
            textField.textColor = textColor
        }
    }

    private func update(button: UIButton, image: UIImage?, color: UIColor?) {
        let image = (image ?? button.currentImage)?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.setImage(image, for: .highlighted)
        if let color = color {
            button.tintColor = color
        }
    }
}
