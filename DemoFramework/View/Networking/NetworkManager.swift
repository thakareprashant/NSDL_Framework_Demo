//
//  NetworkManager.swift
//  DemoFramework
//
//  Created by Apple on 01/06/24.
//


import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    func fetchUsers(page: Int, completion: @escaping (Result<UserResponse, Error>) -> Void) {
        let urlString = "https://reqres.in/api/users?page=\(page)"
        
        AF.request(urlString).validate().responseDecodable(of: UserResponse.self) { response in
            switch response.result {
            case .success(let userResponse):
                completion(.success(userResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
