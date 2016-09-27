//
//  AppDelegate.swift
//  ResultExample
//
//  Created by Vedran Burojevic on 9/26/16
//  Copyright (c) 2016 Infinum. All rights reserved.
//

import UIKit
import SwiftyBeaver

let log = SwiftyBeaver.self

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // Logger
        
        let console = ConsoleDestination()
        log.addDestination(console)
        
        // Wireframe
        
        let wireframe = MainWireframe()
        let rootViewController = wireframe.instantiateAndConfigureModule()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        wireframe.navigationController = navigationController
        
        // Window
        
        window = UIWindow()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }

}
