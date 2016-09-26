//
//  Progressable.swift
//  ResultExample
//
//  Created by Vedran Burojevic on 9/26/16
//  Copyright (c) 2016 Infinum. All rights reserved.
//

import UIKit

protocol Progressable {
    func showLoading()
    func hideLoading()
}

extension Progressable where Self: UIViewController {
    
    func showLoading() {
    }
    
    func hideLoading() {
    }
    
}
