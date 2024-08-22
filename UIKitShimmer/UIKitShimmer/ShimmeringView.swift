import UIKit

class ShimmeringView: UIView {
    
    private let gradientLayer = CAGradientLayer()
    private let animation = CABasicAnimation(keyPath: "locations")
    private let textLayer = CATextLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupShimmeringEffect()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupShimmeringEffect()
    }
    
    private func setupShimmeringEffect() {
        backgroundColor = .clear
        
        // Configure gradientLayer
        gradientLayer.colors = [
            UIColor(white: 1, alpha: 0.3).cgColor, // Slightly tinted clear
            UIColor(white: 1, alpha: 0.7).cgColor,  // Less intense white
            UIColor(white: 1, alpha: 0.3).cgColor  // Slightly tinted clear
        ]
        gradientLayer.locations = [0, 0.5, 1]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
        
        // Configure animation
        animation.fromValue = [-1, -0.5, 0]
        animation.toValue = [1, 1.5, 2]
        animation.duration = 1.5
        animation.repeatCount = .infinity
        animation.autoreverses = false
        gradientLayer.add(animation, forKey: "shimmerAnimation")
        
        // Configure textLayer
        textLayer.string = "Connecting..."
        textLayer.font = UIFont.systemFont(ofSize: 32)
        textLayer.fontSize = 32
        textLayer.alignmentMode = .center
        textLayer.contentsScale = UIScreen.main.scale
        textLayer.frame = bounds
        textLayer.foregroundColor = UIColor.black.cgColor // Text color
        
        // Create mask layer
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        let path = UIBezierPath(rect: bounds)
        maskLayer.path = path.cgPath
        maskLayer.addSublayer(textLayer)
        
        gradientLayer.mask = maskLayer
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
        textLayer.frame = bounds
    }
}
