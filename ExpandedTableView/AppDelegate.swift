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

        // Split View
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let splitViewController = UISplitViewController()
        let navCtrl = UINavigationController(rootViewController: SecondVC())
        splitViewController.viewControllers = [SideMenuController(contentViewController: navCtrl, menuViewController: ListMenuVC()), SecondChildVC()]
        splitViewController.preferredDisplayMode = .allVisible
        self.window!.rootViewController = splitViewController
        self.window!.makeKeyAndVisible()
        
        
//        self.window = UIWindow(frame: UIScreen.main.bounds)
//        let navCtrl = UINavigationController(rootViewController: ViewController())
//        self.window!.rootViewController = SideMenuController(contentViewController: navCtrl, menuViewController: ListMenuVC())
//        self.window!.makeKeyAndVisible()
        
        
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

