//
//  MewsMenuViewController.swift
//  NewsOTT
//
//  Created by Khaled on 23/10/23.
//

import Foundation
import UIKit

class MewsMenuViewController: UIViewController {
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var customGestureView: UIView!
    @IBOutlet private weak var collectionViewHC: NSLayoutConstraint!
    
    private let filterModels = ["trending-str","politics-str","sports-str","talk-show-str","business-str","technology-str","international-str","national-str","entertainment-str","trending-str","politics-str","sports-str","talk-show-str","business-str","technology-str","international-str","national-str","entertainment-str","trending-str","politics-str","sports-str","talk-show-str","business-str"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .estimated(32)))
        item.contentInsets.leading = 16.0
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(32)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.top = 16.0
        section.contentInsets.bottom = 16.0
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    private func setupViews() {
        view.backgroundColor = .appPrimary
        view.alpha = 0.9
        collectionView.clipsToBounds = true
        collectionView.layer.cornerRadius = 10.0
        collectionView.backgroundColor = .init(red: 0, green:  0.167, blue:  0.712, alpha: 0.9)
        setupCollectionView()
        setupTapGesture()
        adjustCollectionViewHeight()
    }
    
    private func setupCollectionView() {
        collectionView.collectionViewLayout = layout()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerNibCell(MenuItemCollectionViewCell.self)
    }
    
    private func setupTapGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissViewController))
        customGestureView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc private func dismissViewController() {
        dismiss(animated: true, completion: nil)
    }
}

extension MewsMenuViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as MenuItemCollectionViewCell
        cell.title = filterModels[indexPath.item].localizableString(UserDefaultsManager.shared.getString(forkey: "localization-language") ?? "en")
        cell.layoutIfNeeded()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        print("selceted: \(indexPath.row)")
        print("Cell Content: \(filterModels[indexPath.row])")
        dismissViewController()
    }
    
    func adjustCollectionViewHeight() {
         collectionView.layoutIfNeeded()

         collectionViewHC.constant = calculateTotalHeight()
         collectionView.invalidateIntrinsicContentSize()
     }

     func calculateTotalHeight() -> CGFloat {
         var totalHeight: CGFloat = 0

         for item in 0..<filterModels.count/2 {
             let indexPath = IndexPath(item: item, section: 0)
             if let cell = collectionView.cellForItem(at: indexPath) {
                 totalHeight += cell.frame.size.height
             }
         }
         return totalHeight + 64
     }
}

extension MewsMenuViewController: StoryboardBased {
    static var storyboardName: String {
        return "Home"
    }
}
