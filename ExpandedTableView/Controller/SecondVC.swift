//
//  SecondVC.swift
//  ExpandedTableView
//
//  Created by Isaías on 7/7/18.
//  Copyright © 2018 IsaiasMac. All rights reserved.
//

import UIKit

class SecondVC: SideMenuSwiftViewController {

    let secondChildButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .orange
        self.navigationItem.title = "Second VC"
        
        secondChildButton.setTitle("Push SecondChildVC", for: .normal)
        secondChildButton.setTitleColor(.black, for: .normal)
        secondChildButton.addTarget(self, action: #selector(pushSecondVC), for: .touchUpInside)
        self.view.addSubview(secondChildButton)
        
        secondChildButton.translatesAutoresizingMaskIntoConstraints = false
        secondChildButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        secondChildButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
    }
    
    @objc func pushSecondVC() {
        self.navigationController?.pushViewController(SecondChildVC(), animated: true)
    }

}
