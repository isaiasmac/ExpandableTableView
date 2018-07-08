//
//  FavoritesVC.swift
//  ExpandedTableView
//
//  Created by Isaías on 7/7/18.
//  Copyright © 2018 IsaiasMac. All rights reserved.
//

import UIKit

class FavoritesVC: SideMenuSwiftViewController {

    let secondChildButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .cyan
        self.navigationItem.title = "Favoritos"
        
        
        secondChildButton.setTitle("Push Favoritos 2", for: .normal)
        secondChildButton.setTitleColor(.blue, for: .normal)
        secondChildButton.addTarget(self, action: #selector(pushSecondVC), for: .touchUpInside)
        self.view.addSubview(secondChildButton)
        
        secondChildButton.translatesAutoresizingMaskIntoConstraints = false
        secondChildButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        secondChildButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    deinit {
        print("deinit FavoritesVC")
    }
    
    @objc func pushSecondVC() {
        self._pushViewController(vc: FavoritesTwoVC(), animated: true, sender: true)
    }

}
