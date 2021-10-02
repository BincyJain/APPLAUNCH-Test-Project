//
//  SearchViewController.swift
//  Test Project
//
//  Created by Bincy Jain on 02/10/21.
//

import UIKit

class SearchViewController: BaseViewController {

    @IBOutlet weak var searchBar: SearchBar!
    @IBOutlet weak var searchTableView: UITableView!
    @IBOutlet weak var searchView: DropShadowView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var views = UIView()
    var searchActive : Bool = false
    let rightTitleButton = UIButton()
    var searchResultArray = [Restaurant]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        self.rightBarView()
        self.updateSearchBar()
        self.setSegmentedControl()
        self.hideKeyboardWhenTappedAround()
        self.searchTableView.register(UINib(nibName: "SearchRestaurantTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchRestaurantCell")
    }
    
    func setSegmentedControl() {
        if #available(iOS 13.0, *) {
            segmentedControl.backgroundColor = .white
            segmentedControl.selectedSegmentTintColor = UIColor.black
            
            let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15, weight: .semibold)]
            segmentedControl.setTitleTextAttributes(titleTextAttributes, for:.normal)
            
            let titleTextAttributes1 = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15, weight: .semibold)]
            segmentedControl.setTitleTextAttributes(titleTextAttributes1, for:.selected)
        } else {
            // Fallback on earlier versions
        }
    }
    
    func updateSearchBar() {
        searchView.layer.cornerRadius = 15
        searchView.layer.shadowColor = UIColor.lightGray.cgColor
        searchView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        searchView.layer.shadowRadius = 15.0
        searchView.layer.shadowOpacity = 0.3
        
        self.searchBar.searchIconColor = .red
        self.searchBar.cancelButtonColor = .cyan
        if let textField = searchBar.getTextField() {
            textField.font = UIFont.systemFont(ofSize: 16)
            textField.backgroundColor = .white
        }

        searchBar.backgroundImage = UIImage()
        searchBar.layer.cornerRadius = 15
        self.searchBar.tintColor = .lightGray
        self.searchBar.delegate = self
        self.searchTableView.tableFooterView = UIView(frame: CGRect.zero)
        self.searchTableView.dataSource = self
        self.searchTableView.delegate = self
        self.searchTableView.keyboardDismissMode = .onDrag
    }

    func rightBarView() {
        rightTitleButton.contentHorizontalAlignment = .right
        rightTitleButton.setImage(UIImage(named: "Image6"), for: .normal)
        rightTitleButton.tintColor = UIColor.black
        rightTitleButton.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
        let leftButtonItem = UIBarButtonItem(customView: rightTitleButton)
        self.navigationItem.rightBarButtonItem = leftButtonItem
    }
    
    @objc func closeButtonAction() {
        self.dismiss(animated: true, completion: nil)
    }
}


extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchActive) {
            return self.searchResultArray.count
        }else{
            return restaurantArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchRestaurantCell", for: indexPath) as! SearchRestaurantTableViewCell
        let display = searchActive == true ?  searchResultArray[indexPath.row] :
            restaurantArray[indexPath.row]
        cell.restaurantData = display
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("view details")
    }
}

//MARK:- SearchBar Delegate
extension SearchViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.isLoading = false
        searchActive = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
        searchBar.isLoading = false
        searchBar.text = nil
        searchBar.resignFirstResponder()
        searchTableView.resignFirstResponder()
        self.searchBar.showsCancelButton = false
        searchTableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.isLoading = true
        searchActive = false
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchBar.isLoading = true
        self.searchActive = true;
        //self.searchBar.showsCancelButton = true
        self.searchResultArray = []
        for  xdata in restaurantArray {
            let nameRange = xdata.restaurantName.range(of: searchText, options: .caseInsensitive)
            if nameRange != nil {
                self.searchResultArray.append(xdata)
            }
        }
        if searchText.isEmpty {
            self.searchResultArray = restaurantArray
        }
        
        searchTableView.reloadData()
    }
}
