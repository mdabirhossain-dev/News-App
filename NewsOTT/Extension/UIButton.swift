//
//  UIButton.swift
//  NewsOTT
//
//  Created by Khaled on 20/9/23.
//

import Foundation
import UIKit

extension UIButton {
    func pulse() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.15
        pulse.fromValue = 0.85
        pulse.toValue = 1.0
        layer.add(pulse, forKey: "pulse")
    }
}
