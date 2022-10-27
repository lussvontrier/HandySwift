//
//  UnderlineSegmentedControl.swift
//  HandySwift
//
//  Created by Lusine Magauzyan on 20.10.22.
//

import UIKit

//TODO: fix
struct UnderlineSegmentedControlOptions {
    let segmentTitleInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)
    let segmentTitleFont = UIFont.systemFont(ofSize: 20)
    let segmentTitleColor = UIColor.lightGray
    let selectedSegmentTitleColor = UIColor.red
    let underlineColor = UIColor.blue
}

class UnderlineSegmentedControl: UIControl {
    
    private var segments: [String]
    private var segmentButtons: [GradientButton] = []
    private var options: UnderlineSegmentedControlOptions
    
    ///Omitted by .valueChanged action the target is subscribed to. Changed when a new segment is tapped.
    private(set) var selectedSegmentIndex: Int = 0
    
    private lazy var segmentStackView: UIStackView = {
        let stackView = ViewFactory.createSimpleStackViewWith(axis: .horizontal, spacing: 0)
        return stackView
    }()
    
    private lazy var underlineSelector: UIView = {
        let view = ViewFactory.createSimpleUIView(with: options.underlineColor)
        return view
    }()
    
    init(with segments: [String], options: UnderlineSegmentedControlOptions = UnderlineSegmentedControlOptions()) {
        self.segments = segments
        self.options = options
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        configureSegmentButtons(with: segments)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setupUI()
    }
    
    private func configureSegmentButtons(with segments: [String]) {
        self.segmentButtons.forEach({$0.removeFromSuperview()})
        self.segmentButtons.removeAll()
        
        for segmentTitle in segments {
            let segment = GradientButton()
            var configuration = GradientButton.Configuration.filled()
            configuration.contentInsets = options.segmentTitleInsets
            configuration.baseBackgroundColor = UIColor.white
            
            var container = AttributeContainer()
            container.font = UIFont.boldSystemFont(ofSize: 20)
            container.foregroundColor = options.segmentTitleColor
            configuration.attributedTitle = AttributedString(segmentTitle, attributes: container)
            segment.configuration = configuration
            
            segment.setGradientLevelLocations(locations: [0.0, 0.0])

            segment.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
            self.segmentButtons.append(segment)
        }
        segmentButtons[selectedSegmentIndex].setGradientLevelLocations(locations: [1.0, 1.0])

//        segmentButtons[selectedSegmentIndex].configuration?.attributedTitle?.foregroundColor = options.selectedSegmentTitleColor
    }
    
    private func setupUI() {
        addSubview(segmentStackView)
        NSLayoutConstraint.activate([
            segmentStackView.leftAnchor.constraint(equalTo: leftAnchor),
            segmentStackView.topAnchor.constraint(equalTo: topAnchor),
            segmentStackView.rightAnchor.constraint(equalTo: rightAnchor),
            segmentStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        segmentStackView.subviews.forEach({ $0.removeFromSuperview() })
        for view in segmentButtons {
            segmentStackView.addArrangedSubview(view)
        }
        
        ///Calling layoutIfNeeded so segment buttons' frame origin x is set before moving forward
        self.layoutIfNeeded()

        addSubview(underlineSelector)
        let selectorWidth = self.frame.width / CGFloat(self.segments.count)
        underlineSelector.frame = CGRect(x: segmentButtons[selectedSegmentIndex].frame.origin.x, y: self.frame.height - 4, width: selectorWidth, height: 4)
    }
    
    @objc private func buttonTapped(sender: UIButton) {
        for (index, segment) in segmentButtons.enumerated() {
            if segment == sender && selectedSegmentIndex != index {
//                if index > selectedSegmentIndex {
//                    segment.animate(forward: true, selected: true)
//                    segmentButtons[selectedSegmentIndex].animate(forward: false, selected: false)
//                } else if index < selectedSegmentIndex {
//                    segment.animate(forward: false, selected: true)
//                    segmentButtons[selectedSegmentIndex].animate(forward: true, selected: false)
//                }

//               segmentButtons[selectedSegmentIndex].configuration?.attributedTitle?.foregroundColor = options.segmentTitleColor
                self.selectedSegmentIndex = index
//                segment.configuration?.attributedTitle?.foregroundColor = options.selectedSegmentTitleColor
                sendActions(for: .valueChanged)
//                UIView.animate(withDuration: 3.0) {
//                    self.underlineSelector.frame.origin.x = segment.frame.origin.x
//                }
            }
        }
    }
    
    ///Call from connected scrollview's scrollViewDidScroll method to continuously update underline's x position
    ///- parameter xPosition: scrollView.contentOffset.x
    func updateUnderline(with xPosition: CGFloat) {
        underlineSelector.frame.origin.x = xPosition / CGFloat(segments.count)
    }
    
    func updateGradientLocations(with xPosition: CGFloat, frameWidth: CGFloat) {
        var percent = (xPosition / frameWidth)
        while percent > 1 {
            percent -= 1
        }
        let location = NSNumber(value: Float(percent))
        let toSelect = Int(percent)+1
        if toSelect < segmentButtons.count {
            segmentButtons[toSelect].setGradientLevelLocations(locations: [location, location])

        }
        
    }
    
    ///Can Call from connected scrollview's scrollViewDidEndDecelerating method to update segment selection UI
    ///- parameter index: Int(scrollView.contentOffset.x / self.frame.width)
    func updateSegmentSelection(with index: Int) {
//        segmentButtons[selectedSegmentIndex].configuration?.attributedTitle?.foregroundColor = options.segmentTitleColor
        selectedSegmentIndex = index
//
//        segmentButtons[selectedSegmentIndex].configuration?.attributedTitle?.foregroundColor = options.selectedSegmentTitleColor
        underlineSelector.frame.origin.x = segmentButtons[selectedSegmentIndex].frame.origin.x
    }
}

