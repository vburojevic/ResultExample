//
//  Router.swift
//  ResultExample
//
//  Created by Vedran Burojevic on 26/09/2016.
//  Copyright © 2016 Infinum. All rights reserved.
//

import Alamofire

enum Router: URLRequestConvertible {
    
    static let baseURL = NSURL(string: "https://jsonplaceholder.typicode.com")!
    
    case Users
    case Comments
    
    private var method: Alamofire.Method {
        switch self {
        case .Users, .Comments:
            return .GET
        }
    }
    
    private var path: String {
        switch self {
        case .Users:
            return "/users"
        case .Comments:
            return "/comments"
        }
    }
    
    var URLRequest: NSMutableURLRequest {
        let mutableURLRequest = NSMutableURLRequest(URL: Router.baseURL.URLByAppendingPathComponent(path))
        mutableURLRequest.HTTPMethod = method.rawValue
                
        switch self {
        default:
            return mutableURLRequest
        }
    }
    
}

