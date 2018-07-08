//
//  UIViewController+Extension.swift
//  ExpandedTableView
//
//  Created by Isaías on 7/8/18.
//  Copyright © 2018 IsaiasMac. All rights reserved.
//

import UIKit

extension UIViewController {
    var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return view.safeAreaLayoutGuide.topAnchor
        } else {
            return topLayoutGuide.bottomAnchor
        }
    }
    
    var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return view.safeAreaLayoutGuide.bottomAnchor
        } else {
            return bottomLayoutGuide.topAnchor
        }
    }
    
    func _pushViewController(vc: UIViewController, animated: Bool, sender: Bool) {
        if self.splitViewController?.isCollapsed == true {
            self.navigationController?.pushViewController(vc, animated: animated)
        }
        else{
            self.splitViewController?.showDetailViewController(vc, sender: sender)
        }
    }
}
