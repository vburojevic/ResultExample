//
//  AppDelegate.swift
//  ResultExample
//
//  Created by Vedran Burojevic on 9/26/16
//  Copyright (c) 2016 Infinum. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let wireframe = MainWireframe()
        let rootViewController = wireframe.instantiateAndConfigureModule()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        wireframe.navigationController = navigationController
        
        window = UIWindow()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }

}
