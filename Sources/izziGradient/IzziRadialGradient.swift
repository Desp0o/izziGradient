//
//  IzziRadialGradient.swift
//  izziGradient
//
//  Created by Despo on 11.11.24.
//

import UIKit

public class IzziRadialGradient: UIView {
    
    public var gradientColors: [UIColor] = [.white, .black] {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public var colorLocations: [CGFloat] = [0.0, 1.0] {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public var centerPoint: CGPoint = CGPoint(x: 0.5, y: 0.5) {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public var radius: CGFloat = 100.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = .clear
    }
    
    override public func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        let cgColors = gradientColors.map { $0.cgColor }
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let gradient = CGGradient(colorsSpace: colorSpace, colors: cgColors as CFArray, locations: colorLocations)!
        
        let center = CGPoint(x: bounds.width * centerPoint.x, y: bounds.height * centerPoint.y)
        
        context.drawRadialGradient(
            gradient,
            startCenter: center,
            startRadius: 0,
            endCenter: center,
            endRadius: radius,
            options: .drawsBeforeStartLocation
        )
    }
}
