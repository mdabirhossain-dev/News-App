//
//  Routers.swift
//  NewsOTT
//
//  Created by Khaled on 18/10/23.
//

import Foundation
import UIKit

// MARK: - NibBased
protocol NibBased {
    static var nibName: String { get }
    static func instantiate() -> Self
}

extension NibBased where Self: UIView {
    static var nibName: String {
        return "\(Self.self)"
    }
    
    static func instantiate() -> Self  {
        let nib = Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        guard let view = nib?.first as? Self else {
            fatalError("Can't load view \(Self.self) from nib \(nibName)")
        }
        return view
    }
}

// MARK: - StoryboardBased
protocol StoryboardBased {
    static var storyboardName: String { get }
    static var storyboardIdentifier: String { get }
    static func instantiate() -> Self
}

extension StoryboardBased where Self: UIViewController {
    static var storyboardName: String {
        return "\(Self.self)"
    }
    
    static var storyboardIdentifier: String {
        return "\(Self.self)"
    }
    
    static func instantiate() -> Self  {
        let storyboard = UIStoryboard(name: storyboardName , bundle: .main)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as? Self else {
            fatalError("Can't load view controller \(Self.self) from storyboard named \(storyboardName)")
        }
        return viewController
    }
}
