//
//  ThirdCollectionViewCell.swift
//  Test Project
//
//  Created by Bincy Jain on 01/10/21.
//

import UIKit

class ThirdCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var advImageView: UIImageView!
    @IBOutlet weak var mainView: UIView!
    
    let imageView = UIImageView()
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageView.setCardViewGrayWithoutBorder(view: self.advImageView)
    }

}
