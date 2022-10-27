//
//  TableView+HandySwift.swift
//  HandySwift
//
//  Created by Lusine Magauzyan on 01.07.22.
//

import UIKit

//This extension is Handy because it eliminates the usage of strings when registering and dequeueing cells with identifier
extension UITableView {
    
    //MARK: UITableViewCell
    ///Registering with UINib
    func registerWithNib(_ type: UITableViewCell.Type) {
        let className = String(describing: type)
        register(UINib(nibName: className, bundle: nil), forCellReuseIdentifier: className)
    }
    
    ///Registering with Class
    func registerCellWithClass(_ type: UITableViewCell.Type) {
        let className = String(describing: type)
        register(type, forCellReuseIdentifier: className)
    }
    
    func dequeueReusableCell<T>(_ type: T.Type) -> T? {
        let className = String(describing: type)
        return dequeueReusableCell(withIdentifier: className) as? T
    }
    
    //MARK: UITableViewHeaderFooter
    ///Registering with UINib
    func registerHeaderFooterWithNib(_ type: UITableViewCell.Type) {
        let className = String(describing: type)
        register(UINib(nibName: className, bundle: nil), forHeaderFooterViewReuseIdentifier: className)
    }
    
    ///Registering with Class
    func registerHeaderFooterWithClass(_ type: UITableViewCell.Type) {
        let className = String(describing: type)
        register(type, forHeaderFooterViewReuseIdentifier: className)
    }

    func dequeueReusableHeaderFooterView<T>(_ type: T.Type) -> T? {
        let className = String(describing: type)
        return dequeueReusableHeaderFooterView(withIdentifier: className) as? T
    }
}
