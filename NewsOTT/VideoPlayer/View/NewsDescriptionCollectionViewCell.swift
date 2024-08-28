//
//  MovieDescriptionCollectionViewCell.swift
//  AmberIT
//
//  Created by Khaled on 2/10/23.
//

import UIKit

extension NewsDescriptionCollectionViewCell {
    class Callback {
    var didTappedShare: () -> Void = { }
    }
}

class NewsDescriptionCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var addToFavoriteListButtonOutlet: UIButton!
    @IBOutlet private weak var shareButtonOutlet: UIButton!
    @IBOutlet private weak var totalView: UIButton!
    @IBOutlet private weak var uploadTime: UIButton!
    @IBOutlet private weak var newsDescription: UILabel!
    
    let callback = Callback()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    @IBAction private func didTappedAddFavoriteList(_ sender: UIButton) {
        print("did Tapped Add List")
    }
    
    @IBAction private func didTappedShare(_ sender: Any) {
        callback.didTappedShare()
        print("did tapped share")
    }
    
    private func setupViews() {
        titleLabel.font = .poppins(.medium_500, size: 20)
        newsDescription.font = .poppins(.regular_400, size: 8.0)
        totalView.titleLabel?.font = .poppins(.regular_400, size: 10.0)
        uploadTime.titleLabel?.font = .poppins(.regular_400, size: 10.0)
        
        addToFavoriteListButtonOutlet.layer.cornerRadius = 14.0
        shareButtonOutlet.layer.cornerRadius = 14.0
        
        addToFavoriteListButtonOutlet.imageView?.tintColor = .white
        shareButtonOutlet.imageView?.tintColor = .white
    }
}

extension NewsDescriptionCollectionViewCell {
    static func dequeue(from collectionView: UICollectionView, at indexPath: IndexPath) -> NewsDescriptionCollectionViewCell {
        return collectionView.dequeueReusableCell(forIndexPath: indexPath)
    }
}
