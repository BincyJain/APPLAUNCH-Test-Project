//
//  FirstCollectionViewCell.swift
//  Test Project
//
//  Created by Bincy Jain on 01/10/21.
//

import UIKit

class FirstCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var leadingTitleLabelConstraint: NSLayoutConstraint!
    
    let views = UIView()
    override func awakeFromNib() {
        super.awakeFromNib()
        self.views.setCardViewGrayWithBorder(view: self.mainView)
//        self.mainView.layer.cornerRadius = 10
//        self.mainView.layer.borderWidth = 1
//        self.mainView.layer.borderColor = UIColor.lightGray
    }

}
