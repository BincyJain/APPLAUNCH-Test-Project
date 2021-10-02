//
//  MoreTableViewCell.swift
//  Test Project
//
//  Created by Bincy Jain on 01/10/21.
//

import UIKit

class MoreTableViewCell: UITableViewCell {

    @IBOutlet weak var seeMoreButton: UIButton!
    
    let buttons = UIButton()
    override func awakeFromNib() {
        super.awakeFromNib()
        self.buttons.setCardViewButtonWithBorder(button: self.seeMoreButton)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
