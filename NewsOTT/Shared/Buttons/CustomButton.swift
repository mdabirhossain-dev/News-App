//
//  VerticalButton.swift
//  NewsOTT
//
//  Created by Khaled on 20/9/23.
//

import Foundation
import UIKit

class CustomButton: UIButton {
    var isleadingImage = false
    var isRoundImage = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentHorizontalAlignment = .left
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        clipsToBounds = true
        layer.cornerRadius = 9.0
        leftButtonImageAndTitle()
        roundImageIcon()
    }
    
    private func leftButtonImageAndTitle() {
        let titleSize = self.titleLabel?.frame.size ?? .zero
        let imageSize = self.imageView?.frame.size  ?? .zero
        let spacing: CGFloat = 4.0
        
        if isleadingImage {
            self.imageEdgeInsets = UIEdgeInsets(top: 0, left: -spacing, bottom: 0, right: spacing)
            self.titleEdgeInsets = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: -spacing)
        } else {
            self.imageEdgeInsets = UIEdgeInsets(top: 0, left: (titleSize.width + spacing), bottom: 0, right:  -titleSize.width)
            self.titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageSize.width, bottom: 0, right: (imageSize.width + spacing))
        }
    }
    
    private func roundImageIcon() {
        if isRoundImage {
            let imageLayer = self.imageView?.layer
            imageLayer?.cornerRadius = min(self.imageView?.frame.width ?? .zero, self.imageView?.frame.height ?? .zero) / 2
            imageLayer?.borderWidth = 2
            imageLayer?.borderColor = UIColor(red: 99/255, green: 130/255, blue: 214/255, alpha: 1).cgColor
        } else {
            let imageLayer = self.imageView?.layer
            imageLayer?.cornerRadius = 0
            imageLayer?.borderWidth = 0
            imageLayer?.borderColor = nil
        }
    }
}
