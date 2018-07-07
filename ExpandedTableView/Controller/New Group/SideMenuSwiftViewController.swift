//
//  SideMenuSwiftViewController.swift
//  ExpandedTableView
//
//  Created by Isaías on 7/7/18.
//  Copyright © 2018 IsaiasMac. All rights reserved.
//

import UIKit

class SideMenuSwiftViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let menuBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(openMenu))
        
        if let navCtrl = self.navigationController {
            
            // En caso de utilizar pushViewController se debe mostrar la Flecha para Volver
            if navCtrl.childViewControllers.count >= 2 {
                let backBarButtonItem = UIBarButtonItem(title: "Volver", style: .plain, target: self, action: #selector(backButton))
                self.navigationItem.leftBarButtonItems = [menuBarButtonItem, backBarButtonItem]
            }
            else{
                self.navigationItem.leftBarButtonItems = [menuBarButtonItem]
            }
        }
    }
    
    @objc func openMenu() {
        self.sideMenuController?.revealMenu(animated: true)
    }
    
    @objc func backButton() {
        print("Back Button...")
        
        self.navigationController?.popViewController(animated: true)
    }

}
