//
//  GradientButton.swift
//  HandySwift
//
//  Created by Lusine Magauzyan on 22.10.22.
//

import UIKit

class GradientButton: UIButton {
        
    private lazy var maskLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private lazy var gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        gradientLayer.colors = [
            UIColor.red.cgColor,
            UIColor.blue.cgColor,
            UIColor.blue.cgColor,
            UIColor.red.cgColor
        ]
            
        gradientLayer.locations = [
            0.0,
            0.0,
            0.0,
            0.0
        ] as [NSNumber]
        
        return gradientLayer
    }()
    
    private lazy var view: UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = false
        view.layer.addSublayer(self.gradientLayer)
        view.mask = self.maskLabel
        return view
    }()
    
    private lazy var animation: CABasicAnimation = {
        let anim = CABasicAnimation(keyPath: "locations")
        anim.duration = 0.3
        anim.fillMode = .forwards
        anim.isRemovedOnCompletion = false
        return anim
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        self.addSubview(view)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        maskLabel.font = self.titleLabel?.font
        maskLabel.text = self.titleLabel?.text
        
        maskLabel.frame = self.titleLabel?.frame ?? .zero
        view.frame = self.bounds
        gradientLayer.frame = view.bounds
        bringSubviewToFront(view)
    }
    
//    func animate(forward: Bool, selected: Bool) {
//
//        if selected {
//            animation.fromValue = [0.0, 0.0]
//            animation.toValue = [1.0, 1.0]
//        } else {
//            animation.fromValue = [1.0, 1.0]
//            animation.toValue = [0.0, 0.0]
//        }
//
//        if forward {
//            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
//            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
//        } else {
//            gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.5)
//            gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.5)
//        }
//
//        gradientLayer.removeAnimation(forKey: "anim")
//        gradientLayer.add(animation, forKey: "anim")
//    }
    
    func setGradientLevelLocations(locations: [NSNumber]) {
        CATransaction.disableAnimations {
            self.gradientLayer.locations = locations
        }
    }
    
    func setGradientColors(colors: [CGColor]) {
        self.gradientLayer.colors = colors
    }
}
