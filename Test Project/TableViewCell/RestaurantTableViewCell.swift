//
//  RestaurantTableViewCell.swift
//  Test Project
//
//  Created by Bincy Jain on 01/10/21.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var bookmarkButton: UIButton!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var offerLabel: UILabel!
    @IBOutlet weak var uptoLabel: UILabel!
    @IBOutlet weak var restaurantLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var orderCountLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var mainView: DropShadowView!
    @IBOutlet weak var offerView: UIView!
    @IBOutlet weak var durationView: UIView!
    @IBOutlet weak var ratingView: UIView!
    
    var restaurantData: Restaurant! {
        didSet {
            self.updateUI()
        }
    }
    
    let views = UIView()
    func updateUI() {
        if restaurantData.bookmark == "0" {
            self.bookmarkButton.setImage(UIImage(named: "bookmarkOffImage"), for: .normal)
            self.bookmarkButton.tintColor = .darkGray
        } else {
            self.bookmarkButton.setImage(UIImage(named: "bookmarkOnImage"), for: .normal)
            self.bookmarkButton.tintColor = .red
        }
        self.categoryLabel.text = restaurantData.category
        self.durationLabel.text = restaurantData.duration + " mins or FREE"
        self.offerLabel.text = restaurantData.offer + "% OFF"
        self.uptoLabel.text =  "Up to ₹" + restaurantData.upto
        self.orderCountLabel.text = restaurantData.orderCount + "+ orders placed from here recently"
        self.rateLabel.text = "₹" + restaurantData.rate + " for one"
        self.ratingLabel.text = restaurantData.rating + " ★"
        self.restaurantLabel.text = restaurantData.restaurantName
        self.foodImageView.image = UIImage(named: restaurantData.image)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.durationView.layer.cornerRadius = 5
        self.offerView.roundCorners([.topRight, .topLeft], [.layerMaxXMaxYCorner, .layerMaxXMinYCorner], radius: 10)
        self.bookmarkButton.layer.cornerRadius = 15
        self.ratingView.layer.cornerRadius = 5
        mainView.layer.cornerRadius = 20
        mainView.layer.shadowColor = UIColor.lightGray.cgColor
        mainView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        mainView.layer.shadowRadius = 15.0
        mainView.layer.shadowOpacity = 0.3
        foodImageView.clipsToBounds = true
        self.foodImageView.roundCornerForImageView([.topLeft, .topRight], [.layerMinXMinYCorner, .layerMaxXMinYCorner], radius: 20.0)
        //self.offerLabel
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
