//
//  UserViewModel.swift
//  Json Data Fetch
//
//  Created by Pranav Arjun on 25/03/20.
//  Copyright © 2020 Pranav Arjun. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol ViewModelDelegate: class {
    func reloadData()
}

class UserViewModel {
    let user: User = User()
    var arrData = [User]()
    var searchData = [User]()
    weak var delegate: ViewModelDelegate?
    let url = URL(string: "https://jsonplaceholder.typicode.com/users")
    
    func getData() {
        
        AF.request(url!, method: .get) .responseJSON { (myResponse) in
            
            switch myResponse.result {
                
            case .success:
                //print(myResponse.result)
                
                let myResult = try? JSON(data: myResponse.data!)
                
                for arr in myResult!.arrayValue{
                    self.arrData.append(User(json: arr))
                    //print(arr["email"])
                }
                print(self.arrData)
                print(myResult!)
                self.delegate?.reloadData()
                break
                
            case .failure:
                break
            }
        }
    }
    
    func numberOfElements() -> Int {
        return arrData.count
    }
    
    func elementAtIndex(index: Int) -> User {
        
        return arrData[index]
        
    }
    
    func searchElementAtIndex(index: Int) -> User {

        return searchData[index]
    }

    func searchNumberOfElements() -> Int {

        return searchData.count
    }
    
    func dataSetupForSearch() -> [User] {
        
        return arrData
        
    }
    
    func filterDataFromUserList (searchText: String) {

        if searchText == "" {
            dataSetupForSearch()
        }else {
            searchData = dataSetupForSearch().filter{
                $0.name.contains(searchText)
            }

        }
    }
}



