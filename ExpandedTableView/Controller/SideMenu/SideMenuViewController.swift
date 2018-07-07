//
//  SideMenuViewController.swift
//  ExpandedTableView
//
//  Created by Isaías on 7/7/18.
//  Copyright © 2018 IsaiasMac. All rights reserved.
//

import UIKit
import SideMenu

class SideMenuViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        let menuLeftNavigationController = UISideMenuNavigationController(rootViewController: ListMenuVC())
        menuLeftNavigationController.leftSide = true
        SideMenuManager.default.menuLeftNavigationController = menuLeftNavigationController
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                           target: self,
                                                           action: #selector(openMenu))
        
    }

    @objc func openMenu() {
        present(SideMenuManager.default.menuLeftNavigationController!, animated: true, completion: nil)
    }
}
