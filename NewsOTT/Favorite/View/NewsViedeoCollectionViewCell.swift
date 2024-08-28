//
//  NewsViedeoCollectionViewCell.swift
//  NewsOTT
//
//  Created by Khaled on 22/10/23.
//

import UIKit

class NewsViedeoCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var customView: UIView!
    @IBOutlet private weak var newsImageView: UIImageView!
    @IBOutlet private weak var newsTitleLabel: UILabel!
    @IBOutlet private weak var totalViews: UIButton!
    @IBOutlet private weak var uploadedTime: UIButton!
    
    var viewModel: NewsInfos? {
        didSet {
            guard let viewModel = viewModel else { return }
            newsImageView.image = UIImage(named: viewModel.newsThumbnail)
            newsTitleLabel.text = viewModel.newsTitle
            let views = "\(viewModel.watched)K Views"
            totalViews.setTitle(views, for: .normal)
            
            let time = "\(viewModel.publishTime)"
            uploadedTime.setTitle(time, for: .normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        contentView.backgroundColor = .appPrimary
        
        totalViews.titleLabel?.minimumScaleFactor = 0.5
        totalViews.titleLabel?.adjustsFontSizeToFitWidth = true
        
        uploadedTime.titleLabel?.minimumScaleFactor = 0.5
        uploadedTime.titleLabel?.adjustsFontSizeToFitWidth = true
        
        newsImageView.layer.cornerRadius = 8.0
        newsTitleLabel.font = .poppins(.regular_400, size: 11.0)
        totalViews.titleLabel?.font = .poppins(.regular_400, size: 7.0)
        uploadedTime.titleLabel?.font = .poppins(.regular_400, size: 7.0)
        
        totalViews.imageView?.tintColor = .white
        uploadedTime.imageView?.tintColor = .white
        
        let textColor = UIColor(red: 0.854, green: 0.854, blue: 0.854, alpha: 1)
        totalViews.titleLabel?.tintColor = textColor
        uploadedTime.imageView?.tintColor = textColor
    }
}

extension NewsViedeoCollectionViewCell {
    static func dequeue(from collectionView: UICollectionView, at indexPath: IndexPath) -> NewsViedeoCollectionViewCell {
        return collectionView.dequeueReusableCell(forIndexPath: indexPath)
    }
}
