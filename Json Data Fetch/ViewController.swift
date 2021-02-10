//
//  ViewController.swift
//  Json Data Fetch
//
//  Created by Pranav Arjun on 24/03/20.
//  Copyright © 2020 Pranav Arjun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var tableView: UITableView!
    var userViewModel : UserViewModel!
    let searchController = UISearchController(searchResultsController: nil)
    var searchData: [User]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      userViewModel = UserViewModel()
        userViewModel.delegate = self
        userViewModel.getData()
        searchBarSetup()
        
        searchData = userViewModel.dataSetupForSearch()
    }
    
    private func searchBarSetup() {
        
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if  (searchController.isActive) {
            return userViewModel.searchNumberOfElements()
            //return searchData.count
        } else {
            return userViewModel.numberOfElements()
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if (searchController.isActive) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
            let searchedUser = userViewModel.searchElementAtIndex(index: indexPath.row)
            cell.nameLabel.text = searchedUser.name
            cell.emailLabel.text = searchedUser.email
            cell.phoneLabel.text = searchedUser.phone

            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
            let user = userViewModel.elementAtIndex(index: indexPath.row)
            cell.nameLabel.text = user.name
            cell.phoneLabel.text = user.phone
            cell.emailLabel.text = user.email
            return cell
        }
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
////            cell.nameLabel?.text = searchData[indexPath.row].name
////            cell.phoneLabel.text = searchData[indexPath.row].phone
////            cell.emailLabel.text = searchData[indexPath.row].email
//
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "UserDetailViewController") as! UserDetailViewController
        let user = userViewModel.elementAtIndex(index: indexPath.row)

//        vc.name = user.name
//        vc.email = user.email
//        vc.phone = user.phone
//        vc.city = user.address!.city
//        vc.street = user.address!.street
//        vc.zipCode = user.address!.zipcode
//        vc.companyName = user.company!.name
//        vc.compCatchPhrase = user.company!.catchPhrase
        
        vc.setupViewModel(user: user)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: ViewModelDelegate {
    func reloadData() {
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }

    }
}

extension ViewController: UISearchBarDelegate, UISearchResultsUpdating {

        func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else {return}
            userViewModel.filterDataFromUserList(searchText: searchText)
            
//            if searchText == "" {
//                userViewModel.dataSetupForSearch()
//            }else {
//                searchData = userViewModel.dataSetupForSearch().filter{
//                    $0.name.contains(searchText)
//                }
//
//            }
        tableView.reloadData()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {

        searchBar.text = ""
        searchData = userViewModel.dataSetupForSearch()

        searchBar.endEditing(true)

        tableView.reloadData()
    }
    
    
}
