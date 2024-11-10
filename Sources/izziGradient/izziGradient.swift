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
    
}
