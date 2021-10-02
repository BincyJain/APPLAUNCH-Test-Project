//
//  OrderAgainCollectionViewCell.swift
//  Test Project
//
//  Created by Bincy Jain on 01/10/21.
//

import UIKit

class OrderAgainCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var offerLabel: UILabel!
    
    var images = UIImageView()
    override func awakeFromNib() {
        super.awakeFromNib()
        self.images.setCardViewGrayWithoutBorder(view: self.foodImageView)
    }

}
