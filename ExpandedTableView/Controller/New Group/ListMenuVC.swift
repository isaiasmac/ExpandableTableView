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

    let coverView = UIView()
    let favoritesButton = UIButton()
    let secondButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        // coverView
        coverView.backgroundColor = .red
        self.view.addSubview(coverView)
        
        // favoritesButton
        favoritesButton.setTitle("Favoritos", for: .normal)
        favoritesButton.setTitleColor(.black, for: .normal)
       // favoritesButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 100.0)
        favoritesButton.addTarget(self, action: #selector(favoritesButtonAction), for: .touchUpInside)
        self.view.addSubview(favoritesButton)
        
        // secondButton
        secondButton.setTitle("Second", for: .normal)
        secondButton.setTitleColor(.black, for: .normal)
        //secondButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 100.0)
        secondButton.addTarget(self, action: #selector(secondButtonAction), for: .touchUpInside)
        self.view.addSubview(secondButton)
        
        /* Constraints */
        
        // coverView
        
        coverView.translatesAutoresizingMaskIntoConstraints = false
        //coverView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 16.0).isActive = true
        coverView.topAnchor.constraint(equalTo: view.safeTopAnchor, constant: 100.0).isActive = true
        coverView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16.0).isActive = true
        coverView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 16.0).isActive = true
        coverView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: -16.0).isActive = true
        
        // favoritesButton
        favoritesButton.translatesAutoresizingMaskIntoConstraints = false
        favoritesButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        favoritesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // secondButton
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        secondButton.topAnchor.constraint(equalTo: favoritesButton.bottomAnchor, constant: 16.0).isActive = true
        secondButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        let navCtrl = UINavigationController(rootViewController: FavoritesVC())
        sideMenuController?.cache(viewController: navCtrl, with: "1")
        
        let navCtrlSecond = UINavigationController(rootViewController: SecondVC())
        sideMenuController?.cache(viewController: navCtrlSecond, with: "2")
        
        DispatchQueue.main.async {
            self.sideMenuController?.revealMenu()
            self.sideMenuController?.hideMenu()
        }
        
        print("SuperView: \(self.view.superview)")
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
