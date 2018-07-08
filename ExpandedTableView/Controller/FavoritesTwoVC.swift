//
//  FavoritesTwoVC.swift
//  ExpandedTableView
//
//  Created by Isaías on 7/7/18.
//  Copyright © 2018 IsaiasMac. All rights reserved.
//

import UIKit

class FavoritesTwoVC: SideMenuSwiftViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.brown
        self.navigationItem.title = "FavoritesTwoVC"
    }
    
    deinit {
        print("deinit FavoritesTwoVC")
    }

}
