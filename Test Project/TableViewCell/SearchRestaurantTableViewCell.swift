//
//  SearchRestaurantTableViewCell.swift
//  Test Project
//
//  Created by Bincy Jain on 02/10/21.
//

import UIKit

class SearchRestaurantTableViewCell: UITableViewCell {

    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var restaurantLabel: UILabel!
    @IBOutlet weak var restaurantLocationLabel: UILabel!
    @IBOutlet weak var orderLabel: UILabel!
    
    var restaurantData: Restaurant! {
        didSet {
            self.updateUI()
        }
    }
    
    var images = UIImageView()
    func updateUI() {
        self.restaurantLabel.text = restaurantData.restaurantName
        self.restaurantLocationLabel.text = restaurantData.location
        self.images.setCardViewGrayWithoutBorder(view: self.foodImageView)
        self.foodImageView.image = UIImage(named: restaurantData.image)
        if restaurantData.order == "0" {
            self.orderLabel.text = "Currently not accepting orders"
        } else {
            self.orderLabel.text = ""
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
