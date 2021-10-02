//
//  SecondTableViewCell.swift
//  Test Project
//
//  Created by Bincy Jain on 01/10/21.
//

import UIKit

class SecondTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var mainView: UIView!
    
    var views = UIView()
    override func awakeFromNib() {
        super.awakeFromNib()
        self.views.setCardViewGrayWithoutBorder(view: self.mainView)
        //self.mainView.layer.cornerRadius = 20
        let FormattedText = NSMutableAttributedString()
        FormattedText.normal("You are free to add it if you need. ")
            .bold("know more")
        
        detailLabel.attributedText = FormattedText
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
