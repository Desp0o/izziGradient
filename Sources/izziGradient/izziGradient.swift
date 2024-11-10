import UIKit

public class LinearGradient: UIView {
    let gradientLayer = CAGradientLayer()
    
    // Property to hold the colors passed by the user
    public var gradientColors: [UIColor] = [] {
        didSet {
            updateGradientColors()
        }
    }
    
    // Initializer for programmatically creating the view
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // Required initializer for using the view in Storyboards or XIBs
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // Method to update the gradient when colors change
    private func updateGradientColors() {
        // Only update the gradient if colors are provided
        if !gradientColors.isEmpty {
            gradientLayer.colors = gradientColors.map { $0.cgColor }
            layer.addSublayer(gradientLayer)
            setNeedsLayout()  
        }
    }
    
    // Ensure the gradient layer’s frame is updated during layout changes
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        // Update the gradient layer frame
        if gradientLayer.frame != bounds {
            gradientLayer.frame = bounds
        }
    }
    
}
