//
//  IzziRadialGradient.swift
//  izziGradient
//
//  Created by Despo on 11.11.24.
//

import UIKit

public class IzziLinearGradient: UIView {
    let gradientLayer = CAGradientLayer()
    
    public var gradientColors: [UIColor] = [] {
        didSet {
            updateGradientColors()
        }
    }
    
    public var startPoint = CGPoint(x: 0.0, y: 0.0) {
        didSet {
            updatePoints()
        }
    }
    
    public var endPoint = CGPoint(x: 0.0, y: 1.0) {
        didSet {
            updatePoints()
        }
    }
    
    public var colorLocations: [NSNumber] = [] {
        didSet {
            updateColorLocations()
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func updateGradientColors() {
        if !gradientColors.isEmpty {
            gradientLayer.colors = gradientColors.map { $0.cgColor }
            layer.addSublayer(gradientLayer)
            setNeedsLayout()
        }
    }
    
    private func updatePoints() {
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        setNeedsLayout()
    }
    
    private func updateColorLocations() {
        gradientLayer.locations = colorLocations
        setNeedsLayout()
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        if gradientLayer.frame != bounds {
            gradientLayer.frame = bounds
        }
    }
    
    public func animateColors(to newColors: [UIColor], duration: CFTimeInterval = 3.0, repeatCount: Float = .infinity, autoReverse: Bool = true) {
        let animation = CABasicAnimation(keyPath: "colors")
        animation.fromValue = gradientLayer.colors
        animation.toValue = newColors.map { $0.cgColor }
        animation.duration = duration
        animation.fillMode = .forwards
        animation.repeatCount = repeatCount
        animation.autoreverses = autoReverse
        animation.isRemovedOnCompletion = false
        gradientLayer.add(animation, forKey: "colorsChange")
    }
    
    public func animatePoints(to startPoint: CGPoint, endPoint: CGPoint, duration: CFTimeInterval = 3.0, repeatCount: Float = .infinity, autoReverse: Bool = true) {
        let startAnimation = CABasicAnimation(keyPath: "startPoint")
        startAnimation.fromValue = gradientLayer.startPoint
        startAnimation.toValue = startPoint
        
        let endAnimation = CABasicAnimation(keyPath: "endPoint")
        endAnimation.fromValue = gradientLayer.endPoint
        endAnimation.toValue = endPoint
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [startAnimation, endAnimation]
        animationGroup.duration = duration
        animationGroup.fillMode = .forwards
        animationGroup.repeatCount = .infinity
        animationGroup.autoreverses = true
        animationGroup.isRemovedOnCompletion = false
        
        gradientLayer.add(animationGroup, forKey: "pointsChange")
    }
}
