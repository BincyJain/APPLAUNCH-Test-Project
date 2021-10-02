//
//  ViewController.swift
//  Test Project
//
//  Created by Bincy Jain on 01/10/21.
//




import UIKit
import CoreLocation

class ViewController: BaseViewController {

    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var searchBarButton: UIButton!
    
    private let refreshControl = UIRefreshControl()
    
    let rightTitleButton = UIButton()
    var buttons = UIButton()
    var sectionArray = ["", "", "", "Order again", "Eat what makes you happy", "", "909 restaurants around you"]
    var orderAgainArray = [OrderAgain]()
    var foodArray = [Home]()
    var lastContentOffset: CGFloat = 0
    var locationManager:CLLocationManager!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.orderAgainArray = [OrderAgain(restaurant: "Alapha Biriyani", duration: "50 mins or FREE", offer: "20% off up to ₹50", location: "", image: "foodImage1"), OrderAgain(restaurant: "Empire Restaurant", duration: "35 mins or FREE", offer: "", location: "North Indian, Bangalore", image: "foodImage2"), OrderAgain(restaurant: "Alapha Biriyani", duration: "50 mins or FREE", offer: "20% off up to ₹50", location: "", image: "foodImage1"), OrderAgain(restaurant: "Empire Restaurant", duration: "35 mins or FREE", offer: "", location: "North Indian, Bangalore", image: "foodImage2")]
        self.foodArray = [Home(text: "Healthy", image: "foodImage1"), Home(text: "Kabab", image: "foodImage2"), Home(text: "Chicken", image: "foodImage3"), Home(text: "Home Style", image: "foodImage1"), Home(text: "Biriyani", image: "foodImage2"), Home(text: "Milkshake", image: "foodImage3"), Home(text: "Chaat", image: "foodImage1"), Home(text: "Pizza", image: "foodImage2")]
        self.buttons.setCardViewButtonGrayWithBorder(button: self.searchBarButton)
        self.callTableView()
        self.homeTableView.dataSource = self
        self.homeTableView.delegate = self
        self.homeTableView.tableFooterView = UIView(frame: CGRect.zero)
        self.homeTableView.keyboardDismissMode = .onDrag
        self.homeTableView.reloadData()
        self.rightBarView()
        self.callRefreshTableView()
        self.callLocationMethod()
    }
    
    func callLocationMethod() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.startUpdatingLocation()
        }
    }
    
    @objc private func refreshWeatherData(_ sender: Any) {
        //sleep(2)
        self.refreshControl.endRefreshing()
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnSwipe = false
    }
    
    func rightBarView() {
        rightTitleButton.contentHorizontalAlignment = .right
        rightTitleButton.setImage(UIImage(named: "image1"), for: .normal)
        let leftButtonItem = UIBarButtonItem(customView: rightTitleButton)
        self.navigationItem.rightBarButtonItem = leftButtonItem
    }
    
    func callRefreshTableView() {
        if #available(iOS 10.0, *) {
            homeTableView.refreshControl = refreshControl
        } else {
            homeTableView.addSubview(refreshControl)
        }
        refreshControl.tintColor = .red
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refreshWeatherData(_:)), for: .valueChanged)
    }
    
    func callTableView() {
        self.homeTableView.register(UINib(nibName: "FirstTableViewCell", bundle: nil), forCellReuseIdentifier: "FirstCell")
        self.homeTableView.register(UINib(nibName: "SecondTableViewCell", bundle: nil), forCellReuseIdentifier: "SecondCell")
        self.homeTableView.register(UINib(nibName: "MoreTableViewCell", bundle: nil), forCellReuseIdentifier: "MoreCell")
        self.homeTableView.register(UINib(nibName: "RestaurantTableViewCell", bundle: nil), forCellReuseIdentifier: "RestaurantCell")
        self.homeTableView.register(UINib(nibName: "HeaderViewTableView", bundle: nil), forHeaderFooterViewReuseIdentifier: "HeaderViewTableView")
    }
    
    @IBAction func searchButtonAction(_ sender: Any) {
        guard let popupVC = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as? SearchViewController else {
           print("SearchViewController not found")
           return
        }
        let navigationController = UINavigationController(rootViewController: popupVC)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sectionArray.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 6 {
            return restaurantArray.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCell", for: indexPath) as! FirstTableViewCell
            cell.firstCollectionView.register(UINib(nibName: "FirstCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FirstCollCell")
            cell.serviceArray = [Home(text: "(1)", image: "bookmarkOffImage"), Home(text: "MAX Safety", image: ""), Home(text: "PRO", image: ""), Home(text: "Cuisines", image: "downarrowImage"), Home(text: "Popular", image: "")]
            cell.collectionString = "FirstCollCell"
            cell.firstCollectionView.reloadData()
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SecondCell", for: indexPath) as! SecondTableViewCell
            return cell
        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCell", for: indexPath) as! FirstTableViewCell
            cell.firstCollectionView.register(UINib(nibName: "ThirdCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ThirdCollCell")
            cell.advertismentArray = ["Image3", "Image3", "Image3"]
            cell.collectionString = "ThirdCollCell"
            cell.setupGridView()
            cell.firstCollectionView.reloadData()
            return cell
        } else if indexPath.section == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCell", for: indexPath) as! FirstTableViewCell
            cell.firstCollectionView.register(UINib(nibName: "OrderAgainCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OrderCollCell")
            cell.orderAgainArray = self.orderAgainArray
            cell.collectionString = "OrderCollCell"
            cell.setupGridView()
            cell.firstCollectionView.reloadData()
            return cell
        } else if indexPath.section == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCell", for: indexPath) as! FirstTableViewCell
            cell.firstCollectionView.register(UINib(nibName: "FoodCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FoodCollCell")
            cell.serviceArray = self.foodArray
            cell.collectionString = "FoodCollCell"
            cell.setupGridView()
            cell.firstCollectionView.reloadData()
            return cell
        } else if indexPath.section == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MoreCell", for: indexPath) as! MoreTableViewCell
            cell.seeMoreButton.addTarget(self, action: #selector(seeMoreAction), for: .touchUpInside)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell", for: indexPath) as! RestaurantTableViewCell
            cell.restaurantData = restaurantArray[indexPath.row]
            cell.bookmarkButton.addTarget(self, action: #selector(updateBookmarkMethod), for: .touchUpInside)
            cell.bookmarkButton.tag = indexPath.row
            return cell
        }
    }
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("dads")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 || indexPath.section == 1  {
            return 70
        } else if indexPath.section ==  2 {
            return 130
        } else if indexPath.section == 3 {
            return tableView.frame.size.width / 4.22
        } else if indexPath.section == 4 {
            return tableView.frame.size.width / 1.4
        } else {
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 3 || section == 4 || section == 6 {
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderViewTableView" ) as! HeaderViewTableView
            headerView.titleLabel.text = self.sectionArray[section]
            if section == 4 || section == 6 {
                headerView.trailingTitleLabelConstraint.constant = 8
                headerView.viewAllButton.isHidden = true
            } else {
                headerView.viewAllButton.isHidden = false
                headerView.trailingTitleLabelConstraint.constant = 96
                headerView.viewAllButton.addTarget(self, action: #selector(viewMoreAction), for: .touchUpInside)
                headerView.viewAllButton.tag = section
            }
            return headerView
        } else {
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 3 || section == 4 || section == 6 {
            return 60
        } else {
            return 0
        }
    }
    
    @objc func viewMoreAction(sender: UIButton) {
        if sender.tag == 1 {
            
        }
    }
    
    @objc func seeMoreAction(sender: UIButton) {
        if sender.tag == 1 {
            
        }
    }

    @objc func updateBookmarkMethod(sender: UIButton) {
        let indexRow = sender.tag
        if restaurantArray[indexRow].bookmark == "0" {
            restaurantArray[indexRow].bookmark = "1"
        } else {
            restaurantArray[indexRow].bookmark = "0"
        }
        self.homeTableView.reloadData()
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation :CLLocation = locations[0] as CLLocation

//        print("user latitude = \(userLocation.coordinate.latitude)")
//        print("user longitude = \(userLocation.coordinate.longitude)"
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(userLocation) { (placemarks, error) in
            
            if (error != nil){
                let yourAttributes: [NSAttributedString.Key: Any] = [
                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14),
                    NSAttributedString.Key.foregroundColor: UIColor.darkGray,
                ]
                print("error in reverseGeocode")
                let attributeString = NSMutableAttributedString(
                    string: "Select your Address",
                    attributes: yourAttributes
                )
                self.leftTitleButton.setAttributedTitle(attributeString, for: .normal)
            } else {
                let placemark = placemarks! as [CLPlacemark]
                if placemark.count>0{
                    let placemark = placemarks![0]
                    print(placemark.locality!)
                    print(placemark.administrativeArea!)
                    print(placemark.country!)
                    let yourAttributes: [NSAttributedString.Key: Any] = [
                        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14),
                        NSAttributedString.Key.foregroundColor: UIColor.black,
                        NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
                        NSAttributedString.Key.underlineColor: UIColor.lightGray
                    ]
                    locationAddress = "\(placemark.locality!), \(placemark.administrativeArea!), \(placemark.country!)"
                    let attributeString = NSMutableAttributedString(
                        string: locationAddress,
                        attributes: yourAttributes
                    )
                    self.leftTitleButton.setAttributedTitle(attributeString, for: .normal)
                    
                    print("\(placemark.locality!), \(placemark.administrativeArea!), \(placemark.country!)")
                }
            }
        }

    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error \(error)")
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.lastContentOffset = scrollView.contentOffset.y
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.lastContentOffset < scrollView.contentOffset.y {
            // did move up
            UIView.animate(withDuration: 0.25, animations: { [weak self] in
                self?.navigationController?.navigationBar.isHidden = true
                
            })
        } else if self.lastContentOffset > scrollView.contentOffset.y {
            // did move down
            UIView.animate(withDuration: 0.25, animations: { [weak self] in
                self?.navigationController?.navigationBar.isHidden = false
            })
        } else {
            // didn't move
        }
    }
}




class BaseViewController: UIViewController {
    let leftTitleButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        leftBarView()
    }
    
    func leftBarView() {
        let yourAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14),
            NSAttributedString.Key.foregroundColor: UIColor.darkGray,
        ]
        var attributeString = NSMutableAttributedString()
        if leftTitleButton.titleLabel?.text == "Select your Address" {
            attributeString = NSMutableAttributedString(
                string: "Select your Address",
                attributes: yourAttributes
            )
        } else {
            let yourAttributes: [NSAttributedString.Key: Any] = [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14),
                NSAttributedString.Key.foregroundColor: UIColor.black,
                NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
                NSAttributedString.Key.underlineColor: UIColor.lightGray
            ]
            attributeString = NSMutableAttributedString(
                string: locationAddress,
                attributes: yourAttributes
            )
        }
        
        leftTitleButton.setAttributedTitle(attributeString, for: .normal)
        leftTitleButton.contentHorizontalAlignment = .left
        leftTitleButton.setTitleColor(UIColor.black, for: .normal)
        leftTitleButton.setImage(UIImage(named: "locationImage"), for: .normal)
        leftTitleButton.tintColor = UIColor.red
        //leftTitleButton.addTarget(self, action: #selector(locationButtonAction), for: .touchUpInside)
        let leftButtonItem = UIBarButtonItem(customView: leftTitleButton)
        self.navigationItem.leftBarButtonItem = leftButtonItem
    }
}
