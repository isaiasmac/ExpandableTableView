//
//  SecondChildVC.swift
//  ExpandedTableView
//
//  Created by Isaías on 7/7/18.
//  Copyright © 2018 IsaiasMac. All rights reserved.
//

import UIKit

class SecondChildVC: SideMenuSwiftViewController {

    let texto = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.darkGray
        self.navigationItem.title = "Second Child VC"
        
        texto.text = "Lorem ipsum bla bla"
        texto.textColor = .white
        self.view.addSubview(texto)
        
        texto.translatesAutoresizingMaskIntoConstraints = false
        texto.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        texto.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }

}
