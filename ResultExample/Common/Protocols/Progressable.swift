//
//  Progressable.swift
//  ResultExample
//
//  Created by Vedran Burojevic on 9/26/16
//  Copyright (c) 2016 Infinum. All rights reserved.
//

import MBProgressHUD

protocol Progressable {
    func showLoading()
    func showLoading(message message: String)
    func hideLoading()
    func hideWithSuccess(message message: String?)
    func hideWithError(message message: String?)
}

extension Progressable where Self: UIViewController {
    
    func showLoading() {
        showLoading(message: "")
    }
    
    func showLoading(message message: String) {
        showHUD(message: message)
    }
    
    func hideLoading() {
        if self is UITableViewController {
            MBProgressHUD.hideHUDForView(self.navigationController?.view ?? self.view, animated: true)
        } else {
            MBProgressHUD.hideHUDForView(self.view, animated: true)
        }
    }
    
    func hideWithSuccess(message message: String?) {
        hideLoading()
        showHUD(message: message, customView: UIImageView(), hideAfter: 3)
    }
    
    func hideWithError(message message: String?) {
        hideLoading()
        showHUD(message: message, customView: UIImageView(), hideAfter: 3)
    }
    
    private func showHUD(message message: String? = nil, customView: UIView? = nil, hideAfter: NSTimeInterval? = nil) {
        let progressHUD: MBProgressHUD
        
        if self is UITableViewController {
            progressHUD = MBProgressHUD.showHUDAddedTo(self.navigationController?.view ?? self.view, animated: true)
        } else {
            progressHUD = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        }
        
        progressHUD.label.text = message
        
        if let customView = customView {
            progressHUD.mode = .CustomView
            progressHUD.customView = customView
        }
        
        if let hideAfter = hideAfter {
            progressHUD.hideAnimated(true, afterDelay: hideAfter)
        }
    }
    
}
