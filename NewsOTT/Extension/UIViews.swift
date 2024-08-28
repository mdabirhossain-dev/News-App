//
//  UIViews.swift
//  NewsOTT
//
//  Created by Khaled on 20/9/23.
//

import Foundation
import UIKit

extension UIView {
    func centerXInSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        if let superViewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superViewCenterXAnchor).isActive = true
        }
    }
    
    func fillSuperview(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewTopAnchor = superview?.topAnchor {
            topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
        }

        if let superviewBottomAnchor = superview?.bottomAnchor {
            bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
        }

        if let superviewLeadingAnchor = superview?.leadingAnchor {
            leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left).isActive = true
        }

        if let superviewTrailingAnchor = superview?.trailingAnchor {
            trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
        }
    }
}

extension UIView {
    func addLinearGradientBackground(colors: [UIColor], startPoint: CGPoint, endPoint: CGPoint) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        
        layer.sublayers?.forEach { layer in
            if layer is CAGradientLayer {
                layer.removeFromSuperlayer()
            }
        }
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func addTopBorderWithColor(_ color: UIColor, width: CGFloat) {
        let borderLayer = CALayer()
        borderLayer.backgroundColor = color.cgColor
        borderLayer.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: width)
        self.layer.addSublayer(borderLayer)
    }
}
