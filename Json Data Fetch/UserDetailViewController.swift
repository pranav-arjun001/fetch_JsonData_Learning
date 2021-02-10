//
//  UserDetailViewController.swift
//  Json Data Fetch
//
//  Created by Pranav Arjun on 26/03/20.
//  Copyright © 2020 Pranav Arjun. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {

    @IBOutlet weak var detailNameLabel: UILabel!
    @IBOutlet weak var detailEmailLabel: UILabel!
    @IBOutlet weak var detailPhoneLabel: UILabel!
    
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var zipCodeLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var companyCatchPhrase: UILabel!
    
    var userDetailViewModel : UserDetailViewModel!
    
//    var name = ""
//    var email = ""
//    var phone = ""
//    var street = ""
//    var city = ""
//    var zipCode = ""
//    var companyName = ""
//    var compCatchPhrase = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //initial-implementation
        //detailNameLabel.text = name
        detailNameLabel.text = userDetailViewModel.userData.name
        detailEmailLabel.text = userDetailViewModel.userData.email
        detailPhoneLabel.text = userDetailViewModel.userData.phone
        streetLabel.text = "Street:\(userDetailViewModel.userData.address!.street)"
        cityLabel.text = "City:\(userDetailViewModel.userData.address!.city)"
        zipCodeLabel.text = "ZipCode:\(userDetailViewModel.userData.address!.zipcode)"
        companyNameLabel.text = "Company Name: \(userDetailViewModel.userData.company!.name)"
        companyCatchPhrase.text = "Company CatchPhrase: \(userDetailViewModel.userData.company!.catchPhrase)"
    }
    
    
    func setupViewModel(user: User) {
        
        userDetailViewModel = UserDetailViewModel()
        
        userDetailViewModel.saveUserData(user: user)
        
        
        
    }

}
