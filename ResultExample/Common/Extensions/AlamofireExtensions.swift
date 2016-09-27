//
//  AlamofireExtensions.swift
//  ResultExample
//
//  Created by Vedran Burojevic on 26/09/2016.
//  Copyright © 2016 Infinum. All rights reserved.
//

import Alamofire
import Unbox
import Result
import enum Result.Result

extension Request {
    
    public func debugLog() -> Self {
            let logString = "===== 🚀 REQUEST 🚀 =====" + "\n" + debugDescription
            log.verbose(logString)
        return self
    }
    
}

extension Request {
    
    func responseObject<T: Unboxable>(queue queue: dispatch_queue_t? = nil, keyPath: String? = nil, options: NSJSONReadingOptions = .AllowFragments, completionHandler: Result<T, NetworkError> -> Void) -> Self {
        return debugLog()
                .responseJSON(completionHandler: { (response: Response<AnyObject, NSError>) in
                    response.debugLog()
                    
                    let result = response
                        .result
                        .mapError { NetworkError.Alamofire($0) }
                        .flatMap({ anyObject -> Result<UnboxableDictionary, NetworkError> in
                            guard let dictionary = anyObject as? UnboxableDictionary else {
                                return .Failure(NetworkError.General)
                            }
                            
                            return .Success(dictionary)
                        })
                        .tryMap { try Unbox($0) as T }
                    
                    completionHandler(result)
                })
    }
    
    func responseArray<T: Unboxable>(queue queue: dispatch_queue_t? = nil, keyPath: String? = nil, options: NSJSONReadingOptions = .AllowFragments, completionHandler: Result<[T], NetworkError> -> Void) -> Self {
        return debugLog()
                .validate()
                .responseJSON(completionHandler: { (response: Response<AnyObject, NSError>) in
                    response.debugLog()
            
                    let result = response.result
                        .mapError { NetworkError.Alamofire($0) }
                        .flatMap({ anyObject -> Result<[UnboxableDictionary], NetworkError> in
                            guard let array = anyObject as? [UnboxableDictionary] else {
                                return .Failure(NetworkError.General)
                            }
                    
                            return .Success(array)
                        })
                        .tryMap { try Unbox($0) as [T] }
            
                    completionHandler(result)
                })
    }
}

extension Response {
    public func debugLog() {
            var logString = "===== ✨ RESPONSE ✨ =====" + "\n\n"
            
            guard let data = data, jsonString = String(data: data, encoding: NSUTF8StringEncoding) else {
                logString += "🔴 ERROR: " + "\n" + "\(debugDescription)" + "\n"
                log.error(logString)
                return
            }
            
            logString += "🔷 RESPONSE:" + "\n" + "\(debugDescription)" + "\n\n"
            
            switch result {
            case .Success(let value):
                logString += jsonString + "\n\n"
                logString += "🔶 SUCCESSFULLY DESERIALIZED: " + "\n" + String(value.dynamicType) + "\n\n"
                log.verbose(logString)
            case .Failure(let error):
                logString += jsonString + "\n"
                logString += "🔴 ERROR: " + "\n" + "\(error)" + "\n\n"
                log.error(logString)
            }
    }
}

extension Alamofire.Result: ResultType {
    
    public init(value: Value) {
        self = .Success(value)
    }
    
    public init(error: Error) {
        self = .Failure(error)
    }
    
    public func analysis<Result>(@noescape ifSuccess ifSuccess: Value -> Result, @noescape ifFailure: Error -> Result) -> Result {
        switch self {
        case let .Success(value):
            return ifSuccess(value)
        case let .Failure(value):
            return ifFailure(value)
        }
    }
    
}
