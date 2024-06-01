//
//  ListViewModel.swift
//  DemoFramework
//
//  Created by Apple on 01/06/24.
//

import Foundation
class ListViewModel{
    
    var listModel:UserResponse?
    func getList(completion:@escaping(()->())){
        
        
        NetworkManager.shared.fetchUsers(page: 1) { result in
                   switch result {
                   case .success(let userResponse):
                      
                       self.listModel = userResponse
                       completion()
                   case .failure(let error):
                       self.listModel = nil
                       completion()
                      
                   }
               }

    }
}
