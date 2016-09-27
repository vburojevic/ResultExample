//
//  WithoutResultUserListInteractor.swift
//  ResultExample
//
//  Created by Vedran Burojevic on 26/09/2016.
//  Copyright (c) 2016 Infinum. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Alamofire
import Unbox
import Result
import enum Result.Result

final class WithoutResultUserListInteractor: NSObject, UserListInteractorInterface {
    
    // MARK: - Public functions -
    
    func loadUsers(withSuccess success: ([User]) -> (), failure: (NetworkError) -> ()) {        
        Alamofire
            .request(Router.Users.URLRequest)
            .debugLog()
            .validate()
            .responseJSON { response in
                response.debugLog()
                
                switch response.result {
                case .Success:
                    guard let dictionaries = response.result.value as? [UnboxableDictionary] else {
                        return success([])
                    }
                
                    do {
                        let users: [User] = try Unbox(dictionaries)
                        success(users)
                    } catch {
                        failure(NetworkError.Unbox(error as! UnboxError))
                    }
                case .Failure(let error):
                    failure(NetworkError.Alamofire(error))
                }
            }
    }
        
}
