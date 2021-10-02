//
//  FoodCollectionViewCell.swift
//  Test Project
//
//  Created by Bincy Jain on 01/10/21.
//

import UIKit

class FoodCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cardContainerView: DropShadowView!
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var foodNameLabel: UILabel!
    
    var images = UIImageView()
    var cornerRadius : CGFloat = 2
    override func awakeFromNib() {
        super.awakeFromNib()
        cornerRadius =  self.foodImageView.frame.size.height / 2
        cardContainerView.layer.cornerRadius = cornerRadius
        cardContainerView.layer.shadowColor = UIColor.lightGray.cgColor
        cardContainerView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        cardContainerView.layer.shadowRadius = 15.0
        cardContainerView.layer.shadowOpacity = 0.3
        foodImageView.layer.cornerRadius = cornerRadius
        foodImageView.clipsToBounds = true
        //cell.foodImageView.frame.size.height / 2
        //self.images.setCard(width: self.foodImageView.frame.size.width, height: self.foodImageView.frame.size.height, cornerRadius: self.foodImageView.frame.size.height / 2, image: self.foodImageView)//.setCardViewRoundWithoutBorder(view: self.foodImageView)
        //self.foodImageView.layer.cornerRadius = foodImageView.frame.size.height / 2
    }

}
