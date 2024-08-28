//
//  FavoriteCollectionViewCell.swift
//  NewsOTT
//
//  Created by Khaled on 19/10/23.
//

import UIKit

class FavoriteCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var thumbImageView: UIImageView!
    @IBOutlet private weak var bottomView: UIView!
    @IBOutlet private weak var progressView: UIProgressView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var remainingTileLabel: UILabel!
    @IBOutlet private weak var customContainerView: UIView!
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    var thumbImage: String? {
        didSet {
            guard let image = thumbImage else { return }
            thumbImageView.image = UIImage(named: image)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        titleLabel.font = .poppins(.regular_400, size: 10.0)
        remainingTileLabel.font = .montserrat(.regular_400, size: 7.5)
        thumbImageView.layer.cornerRadius = 5.0
        customContainerView.layer.cornerRadius = 5.0
    }
}

extension FavoriteCollectionViewCell {
    static func dequeue(from collectionView: UICollectionView, at indexPath: IndexPath) -> FavoriteCollectionViewCell {
        return collectionView.dequeueReusableCell(forIndexPath: indexPath)
    }
}
