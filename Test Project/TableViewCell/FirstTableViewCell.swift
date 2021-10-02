//
//  FirstTableViewCell.swift
//  Test Project
//
//  Created by Bincy Jain on 01/10/21.
//

import UIKit

class FirstTableViewCell: UITableViewCell {

    @IBOutlet weak var firstCollectionView: UICollectionView!
    
    var collectionString: String = ""
    var serviceArray = [Home]()
    var advertismentArray = [String]()
    var orderAgainArray = [OrderAgain]()
    var screenWidth: CGFloat = 0.0
    var screenHeght: CGFloat = 0.0
    var images = UIImageView()
    override func awakeFromNib() {
        super.awakeFromNib()
        self.firstCollectionView.dataSource = self
        self.firstCollectionView.delegate = self
        self.setupGridView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupGridView() {
        if self.collectionString == "FoodCollCell" {
            let flow = firstCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
            flow.scrollDirection = .vertical
            firstCollectionView.isScrollEnabled = false
        }
    }
}

extension FirstTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.collectionString == "FirstCollCell" || self.collectionString == "FoodCollCell" {
            return self.serviceArray.count
        } else if self.collectionString == "ThirdCollCell" {
            return self.advertismentArray.count
        } else if self.collectionString == "OrderCollCell" {
            return self.orderAgainArray.count
        } else {
            return 2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if self.collectionString == "FirstCollCell" {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.collectionString, for: indexPath) as! FirstCollectionViewCell
            cell.titleLabel.text = self.serviceArray[indexPath.row].text
            if self.serviceArray[indexPath.row].image == "" {
                cell.leadingTitleLabelConstraint.constant = 8
                cell.titleImageView.image = UIImage(named: "locationImage")
                cell.titleImageView.tintColor = UIColor.white
            } else {
                cell.titleImageView.tintColor = UIColor.black
                cell.leadingTitleLabelConstraint.constant = 25
                cell.titleImageView.image = UIImage(named: self.serviceArray[indexPath.row].image)
            }
            return cell
        } else if self.collectionString == "ThirdCollCell" {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.collectionString, for: indexPath) as! ThirdCollectionViewCell
            cell.advImageView.image = UIImage(named: self.advertismentArray[indexPath.row])
            return cell
        } else if self.collectionString == "OrderCollCell" {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.collectionString, for: indexPath) as! OrderAgainCollectionViewCell
            cell.foodImageView.image = UIImage(named: self.orderAgainArray[indexPath.row].image)
            //cell.foodImageView.layer.cornerRadius = 10
            cell.foodNameLabel.text = self.orderAgainArray[indexPath.row].restaurant
            cell.timeLabel.text = self.orderAgainArray[indexPath.row].duration
            cell.offerLabel.text = self.orderAgainArray[indexPath.row].offer
            if self.orderAgainArray[indexPath.row].offer == "" {
                cell.offerLabel.text = self.orderAgainArray[indexPath.row].location
                cell.offerLabel.textColor = .lightGray
            }
            return cell
        } else if self.collectionString == "FoodCollCell" {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.collectionString, for: indexPath) as! FoodCollectionViewCell
            cell.foodImageView.image = UIImage(named: self.serviceArray[indexPath.row].image)
            cell.foodNameLabel.text = self.serviceArray[indexPath.row].text
            return cell
        } else {
           return UICollectionViewCell()
        }
    }
}

extension FirstTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("asdd")
    }
    
}
extension FirstTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if self.collectionString == "FirstCollCell" {
            let nw = self.serviceArray[indexPath.row].text
            let image = self.serviceArray[indexPath.row].image
            let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
            let size = CGSize(width: 250, height: 1500)

            let estimatedFrame = NSString(string: nw).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)], context: nil)
            let attributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)]

            let yourLabelSize: CGSize = nw.size(withAttributes:attributes )
            var width1 = yourLabelSize.width + 30
            if width1 < 30 {
                width1 = 30
            }
            var withoutImage = estimatedFrame.width
            if image != "" {
                withoutImage = withoutImage + 20
            }
            return CGSize(width: withoutImage + 25, height: 40)
        } else if self.collectionString == "OrderCollCell" {
            let itemsPerRow:CGFloat = 1.7
            let hardCodedPadding:CGFloat = 10
            let itemWidth = (collectionView.bounds.width / itemsPerRow) - hardCodedPadding
            return CGSize(width: itemWidth, height: collectionView.frame.size.height)
        } else if self.collectionString == "FoodCollCell" {
            let itemsPerRow:CGFloat = 4
            let hardCodedPadding:CGFloat = 8
            let itemWidth = (collectionView.bounds.width / itemsPerRow) - hardCodedPadding
            return CGSize(width: itemWidth, height: itemWidth + 30)
        } else if self.collectionString == "ThirdCollCell" {
            let itemsPerRow:CGFloat = 2
            let hardCodedPadding:CGFloat = 4
            let itemWidth = (collectionView.bounds.width / itemsPerRow) - hardCodedPadding
            return CGSize(width: itemWidth, height: collectionView.frame.size.height)
        } else {
            return CGSize(width: screenWidth, height: screenHeght)
        }
    }

}

/*
 if self.collectionString == "ThirdCollCell" {
//            let flow = firstCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
//            // If you create collectionView programmatically then just create this flow by UICollectionViewFlowLayout() and init a collectionView by this flow.
//            //flow.scrollDirection = .vertical
//            let itemSpacing: CGFloat = 2
//            let itemsInOneLine: CGFloat = 2
//            flow.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
//
//            //collectionView.frame.width is the same as  UIScreen.main.bounds.size.width here.
//            let width = firstCollectionView.frame.size.width - itemSpacing * CGFloat(itemsInOneLine - 1)
//            screenWidth = floor(width/itemsInOneLine + 10)
//            screenHeght = width/itemsInOneLine * 0.7
//            flow.itemSize = CGSize(width: floor(width/itemsInOneLine + 10), height: width/itemsInOneLine * 0.7)
//            flow.minimumInteritemSpacing = 2
//            flow.minimumLineSpacing = 16
//            print(width)


 } else
 else if self.collectionString == "OrderCollCell" {
     let flow = firstCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
     // If you create collectionView programmatically then just create this flow by UICollectionViewFlowLayout() and init a collectionView by this flow.
     //flow.scrollDirection = .vertical
     let itemSpacing: CGFloat = 2
     let itemsInOneLine: CGFloat = 2
     flow.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
     
     //collectionView.frame.width is the same as  UIScreen.main.bounds.size.width here.
     let width = firstCollectionView.frame.size.width - itemSpacing * CGFloat(itemsInOneLine - 1)
     screenWidth = floor(width/itemsInOneLine)
     screenHeght = width/itemsInOneLine * 0.7
     flow.itemSize = CGSize(width: floor(width/itemsInOneLine), height: width/itemsInOneLine * 0.7)
     flow.minimumInteritemSpacing = 2
     flow.minimumLineSpacing = 16
     print(width)
 }
 */
