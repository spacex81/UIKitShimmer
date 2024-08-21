import UIKit

class ShimmeringView: UIView {
    
    private let gradientLayer = CAGradientLayer()
    private let animation = CABasicAnimation(keyPath: "locations")
    
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
        
        gradientLayer.colors = [
            UIColor(white: 1, alpha: 0.3).cgColor, // Slightly tinted clear
            UIColor(white: 1, alpha: 0.4).cgColor,  // Less intense white
            UIColor(white: 1, alpha: 0.3).cgColor  // Slightly tinted clear
         ]
//        gradientLayer.locations = [0, 0.5, 1]
        gradientLayer.locations = [0, 0.5, 1]
//        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
//        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
        
        animation.fromValue = [-1, -0.5, 0]
        animation.toValue = [1, 1.5, 2]
        animation.duration = 1.5
        animation.repeatCount = .infinity
        animation.autoreverses = false
        gradientLayer.add(animation, forKey: "shimmerAnimation")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
}
