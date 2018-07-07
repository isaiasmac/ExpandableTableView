//
//  ListMenuVC.swift
//  ExpandedTableView
//
//  Created by Isaías on 7/7/18.
//  Copyright © 2018 IsaiasMac. All rights reserved.
//

import UIKit
//import SideMenu
import SideMenuSwift

class ListMenuVC: UIViewController {

    let favoritesButton = UIButton()
    let secondButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        // favoritesButton
        favoritesButton.setTitle("Favoritos", for: .normal)
        favoritesButton.setTitleColor(.black, for: .normal)
        favoritesButton.addTarget(self, action: #selector(favoritesButtonAction), for: .touchUpInside)
        self.view.addSubview(favoritesButton)
        
        // secondButton
        secondButton.setTitle("Second", for: .normal)
        secondButton.setTitleColor(.black, for: .normal)
        secondButton.addTarget(self, action: #selector(secondButtonAction), for: .touchUpInside)
        self.view.addSubview(secondButton)
        
        /* Constraints */
        
        // favoritesButton
        favoritesButton.translatesAutoresizingMaskIntoConstraints = false
        favoritesButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 136.0).isActive = true
        favoritesButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        favoritesButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        
        // secondButton
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        secondButton.topAnchor.constraint(equalTo: favoritesButton.bottomAnchor, constant: 16.0).isActive = true
        secondButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        secondButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        
        
        let navCtrl = UINavigationController(rootViewController: FavoritesVC())
        self.sideMenuController?.cache(viewController: navCtrl, with: "1")
        
        let navCtrlSecond = UINavigationController(rootViewController: SecondVC())
        self.sideMenuController?.cache(viewController: navCtrlSecond, with: "2")
    }
    
    
    @objc func favoritesButtonAction() {
        print("favoritesButtonAction...")
        //SideMenuManager.default.menuLeftNavigationController!.pushViewController(FavoritesVC(), animated: true)
        
        sideMenuController?.hideMenu()
        sideMenuController?.setContentViewController(with: "1")
    }

    @objc func secondButtonAction() {
        print("secondButtonAction...")
        //SideMenuManager.default.menuLeftNavigationController!.pushViewController(FavoritesVC(), animated: true)
        
        sideMenuController?.hideMenu()
        sideMenuController?.setContentViewController(with: "2")
    }
}
