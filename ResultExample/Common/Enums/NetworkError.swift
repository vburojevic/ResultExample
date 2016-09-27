//
//  NetworkError.swift
//  ResultExample
//
//  Created by Vedran Burojevic on 26/09/2016.
//  Copyright © 2016 Infinum. All rights reserved.
//

import Alamofire
import Unbox
import Result
import enum Result.Result

enum NetworkError: ErrorType {
    case General
    case Alamofire(NSError)
    case Unbox(UnboxError)
    
    var message: String {
        switch self {
        case .General:
            return "General error"
        case .Alamofire(let error):
            return "Alamofire error: \(error.localizedDescription)"
        case .Unbox(let error):
            return "Unbox error: \(error.description)"
        }
    }
}

extension NetworkError: ErrorTypeConvertible {
    internal static func errorFromErrorType(error: ResultErrorType) -> NetworkError {
        if error is UnboxError {
            return NetworkError.Unbox(error as! UnboxError)
        } else {
            return NetworkError.Alamofire(error as NSError)
        }
    }
}

extension UnboxError: ErrorTypeConvertible {
    public static func errorFromErrorType(error: ResultErrorType) -> UnboxError {
        return error as! UnboxError
    }
}
