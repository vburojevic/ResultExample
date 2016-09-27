//
//  WithResultUserListInteractor.swift
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

final class WithResultUserListInteractor: NSObject, UserListInteractorInterface {
    
    // MARK: - Public functions -
    
    func loadUsers(withResultHandler resultHandler: (Result<[User], NetworkError>) -> ()) {
        Alamofire.request(Router.Users.URLRequest)
            .debugLog()
            .validate()
            .responseJSON { response in
                response.debugLog()
                
                resultHandler(response.result
                    .mapError { NetworkError.Alamofire($0) }
                    .map { $0 as? [UnboxableDictionary] ?? [] }            
                    .tryMap { try Unbox($0) as [User] })
        } 
        
//        Alamofire
//            .request(Router.Users.URLRequest)
//            .validate()
//            .responseArray { (result: Result<[User], NetworkError>) in
//                resultHandler(result)
//        }
    }
    
}
