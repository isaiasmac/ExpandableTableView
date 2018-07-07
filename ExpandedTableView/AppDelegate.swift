//
//  AppDelegate.swift
//  ExpandedTableView
//
//  Created by Isaías on 7/4/18.
//  Copyright © 2018 IsaiasMac. All rights reserved.
//

import UIKit
import CoreData
import SideMenuSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
//        self.window = UIWindow(frame: UIScreen.main.bounds)
//        let vc = ViewController()
//        let navCtrl = CustomNavigationController(rootViewController: vc)
//        self.window!.rootViewController = navCtrl
//        self.window!.makeKeyAndVisible()
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let navCtrl = UINavigationController(rootViewController: ViewController())
        self.window!.rootViewController = SideMenuController(contentViewController: navCtrl, menuViewController: ListMenuVC())
        self.window!.makeKeyAndVisible()
        
        SideMenuController.preferences.basic.menuWidth = 240
        SideMenuController.preferences.basic.statusBarBehavior = .slide
        SideMenuController.preferences.basic.enablePanGesture = false
        SideMenuController.preferences.basic.supportedOrientations = [.portrait, .landscape]
        
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        CoreDataStack.saveContext()
    }

}

