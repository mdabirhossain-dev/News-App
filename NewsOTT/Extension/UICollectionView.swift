//
//  UICollectionView.swift
//  NewsOTT
//
//  Created by Khaled on 18/10/23.
//

import Foundation
import UIKit

extension UICollectionView {
    func registerCell<T: UICollectionViewCell>(_ cellClass: T.Type) {
        register(cellClass, forCellWithReuseIdentifier: T.reuseID)
    }
    
    func registerNibCell<T: UICollectionViewCell>(_ cellClass: T.Type, nibName: String = T.reuseID) {        register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: T.reuseID)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseID, for: indexPath) as? T else {
            fatalError("fatalError: Could not dequeue cell with identifier: \(T.reuseID) for cell at \(indexPath)")
        }
        return cell
    }
}
