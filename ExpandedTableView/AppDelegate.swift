//
//  AppDelegate.swift
//  ExpandedTableView
//
//  Created by Isaías on 7/4/18.
//  Copyright © 2018 IsaiasMac. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let homeVC = ViewController()
        self.window!.rootViewController = homeVC
        self.window!.makeKeyAndVisible()
        
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        CoreDataStack.saveContext()
    }

}

