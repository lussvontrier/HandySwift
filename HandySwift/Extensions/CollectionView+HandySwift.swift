//
//  CollectionView+HandySwift.swift
//  HandySwift
//
//  Created by Lusine Magauzyan on 05.07.22.
//

import UIKit

//This extension is Handy because it eliminates the usage of strings when registering and dequeueing items with identifier
extension UICollectionView {
    //MARK: UICollectionViewItem
    ///Registering with UINib
    func registerWithNib(_ type: UICollectionViewCell.Type) {
        let className = String(describing: type)
        register(UINib(nibName: className, bundle: nil), forCellWithReuseIdentifier: className)
    }
    
    ///Registering with Class
    func registerCellWithClass(_ type: UICollectionViewCell.Type) {
        let className = String(describing: type)
        register(type, forCellWithReuseIdentifier: className)
    }
    
    func dequeueReusableCell<T>(_ type: T.Type, for indexPath: IndexPath) -> T? {
        let className = String(describing: type)
        return dequeueReusableCell(withReuseIdentifier: className, for: indexPath) as? T
    }
}


