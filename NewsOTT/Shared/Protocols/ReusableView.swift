//
//  ReuseableView.swift
//  NewsOTT
//
//  Created by Khaled on 18/10/23.
//

import Foundation
import UIKit

protocol ReusableView {
    static var reuseID: String { get }
}

extension ReusableView {
    static var reuseID: String {
        return String(describing: Self.self)
    }
}

extension UICollectionViewCell: ReusableView {}
