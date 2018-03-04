//
//  UITableView+Generics.swift
//  GenericViewController
//
//  Created by Maxim Shelepyuk on 03/03/2018.
//  Copyright © 2018 Maxim Shelepyuk. All rights reserved.
//

import UIKit.UITableView

extension UITableView {
    
    func registerNib<T: UITableViewCell>(forType type: T.Type) {
        registerNib(forType: type, reuseIdentifier: type.className)
    }
    
    func registerNib<T: UITableViewCell>(forType type: T.Type, reuseIdentifier: String) {
        let nib = UINib(nibName: type.className, bundle: nil)
        register(nib, forCellReuseIdentifier: reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: T.className, for: indexPath) as! T
    }
}
