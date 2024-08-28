//
//  AutoScrollingCollectionViewCell.swift
//  NewsOTT
//
//  Created by Khaled on 26/10/23.
//

import UIKit

class AutoScrollingCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var scrollView: EFAutoScrollLabel!
    
    var breakingNews: String? {
        didSet {
            scrollView.attributedText = attributedTextWithCirclePointAndBreakingNews(breakingNews: breakingNews ?? "")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addControls()
    }
    
    private func addControls() {
        scrollView.font = .poppins(.regular_400, size: 16.0)
        scrollView.labelSpacing = UIScreen.main.bounds.width
        scrollView.pauseInterval = 1.7
        scrollView.scrollSpeed = 30
        scrollView.textAlignment = NSTextAlignment.left
        scrollView.fadeLength = 12
        scrollView.scrollDirection = EFAutoScrollDirection.left
        scrollView.isUserInteractionEnabled = false
    }
    
    func attributedTextWithCirclePointAndBreakingNews(breakingNews: String) -> NSAttributedString {
        let circlePointAttachment = NSTextAttachment()
        let circlePointImage = UIImage(named: "circle-red")
        circlePointAttachment.image = circlePointImage
        circlePointAttachment.bounds = CGRect(x: 0, y: 0, width: 8, height: 8)

        let attributedString = NSMutableAttributedString()
        let attributedStringWithImage = NSAttributedString(attachment: circlePointAttachment)
        attributedString.append(attributedStringWithImage)
        
        let breakingNewsString = " Breaking News: "
        let breakingNewsAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor(red: 255/255, green: 0, blue: 0, alpha: 1)]
        attributedString.append(NSAttributedString(string: breakingNewsString, attributes: breakingNewsAttributes))

        let news = breakingNews
        let newsAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white]
        attributedString.append(NSAttributedString(string: news, attributes: newsAttributes))

        return attributedString
    }
}

extension AutoScrollingCollectionViewCell {
    static func dequeue(from collectionView: UICollectionView, at indexPath: IndexPath) -> AutoScrollingCollectionViewCell {
        return collectionView.dequeueReusableCell(forIndexPath: indexPath)
    }
}
