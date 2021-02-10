//
//  UserModel.swift
//  
//
//  Created by Pranav Arjun on 24/03/20.
//

import Foundation
import SwiftyJSON

struct User {
    //let userViewModel: UserViewModel = UserViewModel()
    var id : String = ""
    var name: String = ""
    var email: String = ""
    var address: Address?
    var phone: String = ""
    var company: Company?
    
    init() {
        
    }
    
    init(json: JSON) {
        
        id = json["id"].stringValue
        name = json["name"].stringValue
        email = json["email"].stringValue
        phone = json["phone"].stringValue
       let tempAddress = json["address"]
        address = Address(json: tempAddress)
        print(address?.city)
        let tempCompany = json["company"]
        company = Company(json: tempCompany)
        print(company!)
    }
}

struct Address {
    
    var street: String
    var city: String
    var zipcode: String
    
    init(json: JSON) {
        street = json["street"].stringValue
        city = json["city"].stringValue
        zipcode = json["zipcode"].stringValue
    }
}

struct Company {
    var name: String
    var catchPhrase: String
    
    init(json: JSON) {
        name = json["name"].stringValue
        catchPhrase = json["catchPhrase"].stringValue
    }
}




