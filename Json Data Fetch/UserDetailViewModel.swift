//
//  UserDetailViewModel.swift
//  Json Data Fetch
//
//  Created by Pranav Arjun on 26/03/20.
//  Copyright © 2020 Pranav Arjun. All rights reserved.
//

import Foundation

class UserDetailViewModel {
    
    var userData: User!
    func saveUserData(user: User) {
        
        userData = user
    }
}
