//
//  ViewFactory.swift
//  HandySwift
//
//  Created by Lusine Magauzyan on 20.10.22.
//

import UIKit

class ViewFactory {
    
    class func createSimpleStackViewWith(axis: NSLayoutConstraint.Axis, spacing: CGFloat = 1) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.alignment = .fill
        stackView.spacing = spacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        return stackView
    }
    
    class func createSimpleLabelWith(textColor: UIColor, font: UIFont, textAlignment: NSTextAlignment = .left, backgroundColor: UIColor = .clear) -> UILabel {
        let label: UILabel = UILabel()
        label.textColor = textColor
        label.font = font
        label.textAlignment = textAlignment
        label.backgroundColor = backgroundColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    class func createSimpleImageViewWith(imageName: String?, backgroundColor: UIColor = UIColor.clear, contentMode: UIView.ContentMode = .scaleAspectFill, cornerRadius: CGFloat = 0.0) -> UIImageView {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = contentMode
        imageView.layer.cornerRadius = cornerRadius
        imageView.backgroundColor = backgroundColor
        if let imageName = imageName {
            imageView.image = UIImage(named: imageName)
        }
        return imageView
    }
    
    class func createSimpleUIView(with backgroundColor: UIColor = UIColor.clear, cornerRadius: CGFloat? = nil, borderColor: CGColor? = nil, borderWidth: CGFloat = 0) -> UIView {
        let newView = UIView()
        newView.backgroundColor = backgroundColor
        newView.layer.borderColor = borderColor
        newView.layer.borderWidth = borderWidth
        newView.translatesAutoresizingMaskIntoConstraints = false
        if let cornerRadius = cornerRadius {
            newView.layer.cornerRadius = cornerRadius
        }
        return newView
    }
    
    class func createTableViewWith(cellClass: AnyClass?, forCellWithReuseIdentifier: String, headerClass:AnyClass?, forHeaderWithReuseIdentifier: String) -> UITableView {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.separatorStyle = .none
        view.register(cellClass, forCellReuseIdentifier: forCellWithReuseIdentifier)
        view.register(headerClass, forHeaderFooterViewReuseIdentifier: forHeaderWithReuseIdentifier)
        view.tableFooterView = UIView()
        return view
    }
    
    class func createSimpleTableViewWith(cellClass: AnyClass?, forCellWithReuseIdentifier: String) -> UITableView {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.separatorStyle = .none
        view.register(cellClass, forCellReuseIdentifier: forCellWithReuseIdentifier)
        view.tableFooterView = UIView()
        return view
    }
    
    class func createASimpleButton(with backgroundColor: UIColor = UIColor.white, cornerRadius: CGFloat = 5.0, font: UIFont = UIFont.systemFont(ofSize: 12), textColor color: UIColor = UIColor.black) -> UIButton {
        let btn = UIButton(type: .system)
        btn.backgroundColor = backgroundColor
        btn.layer.cornerRadius = cornerRadius
        btn.clipsToBounds = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.font = font
        btn.tintColor = UIColor.black
        btn.setTitleColor(color, for: .normal)
        btn.contentMode = .scaleAspectFit
        return btn
    }
    
    class func createASimpleCollectionViewWith(cellClass: AnyClass?,
                                               forCellWithReuseIdentifier: String,
                                               sectionInset: UIEdgeInsets,
                                               minimumInteritemSpacing: CGFloat,
                                               minimumLineSpacing: CGFloat,
                                               backgroundColor: UIColor,
                                               cornerRadius: CGFloat,
                                               borderColor: CGColor = UIColor.white.cgColor,
                                               borderWidth: CGFloat = 0.0,
                                               direction:UICollectionView.ScrollDirection = .horizontal) -> UICollectionView {
        
        let layout                                      = UICollectionViewFlowLayout()
        layout.scrollDirection                          = direction
        layout.sectionInset                             = sectionInset
        layout.minimumInteritemSpacing                  = minimumInteritemSpacing
        layout.minimumLineSpacing                       = minimumLineSpacing
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(cellClass, forCellWithReuseIdentifier: forCellWithReuseIdentifier)
        view.backgroundColor                            = backgroundColor
        view.layer.cornerRadius                         = cornerRadius
        view.layer.borderColor                          = borderColor
        view.layer.borderWidth                          = borderWidth
        view.isScrollEnabled                            = true
        return view
    }

    class func createCollectionViewWith(cellClass: AnyClass?, forCellWithReuseIdentifier: String, headerClass: AnyClass? = nil, layout: UICollectionViewLayout = UICollectionViewLayout(), forHeaderWithReuseIdentifier: String? = nil) -> UICollectionView {
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        collectionview.register(cellClass, forCellWithReuseIdentifier: forCellWithReuseIdentifier)
        if let header = headerClass, let identifyer = forHeaderWithReuseIdentifier {
        collectionview.register(header, forCellWithReuseIdentifier: identifyer)
        }
        return collectionview
    }
    
    class func createTextFieldWith(textColor: UIColor,
                                   font: UIFont = UIFont.systemFont(ofSize: 12),
                                   textAlignment: NSTextAlignment = .center,
                                   backgroundColor: UIColor = .clear,
                                   keyboardType: UIKeyboardType = .default,
                                   placeholder: String? = nil) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = font
        textField.textAlignment = textAlignment
        textField.keyboardType = keyboardType
        textField.placeholder = placeholder
        return textField
    }
}

