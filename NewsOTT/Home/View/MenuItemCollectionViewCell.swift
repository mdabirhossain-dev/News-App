//
//  MenuItemCollectionViewCell.swift
//  NewsOTT
//
//  Created by Khaled on 23/10/23.
//

import UIKit

class MenuItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var filterContentLabel: UILabel!
    
    var title: String? {
        didSet {
            filterContentLabel.text = title
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        filterContentLabel.font = .poppins(.regular_400, size: 16.0)
    }
}

extension MenuItemCollectionViewCell {
    static func dequeue(from collectionView: UICollectionView, at indexPath: IndexPath) -> MenuItemCollectionViewCell {
        return collectionView.dequeueReusableCell(forIndexPath: indexPath)
    }
}
