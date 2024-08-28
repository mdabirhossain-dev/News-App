//
//  VideoPlayerLayouts.swift
//  AmberIT
//
//  Created by Khaled on 5/10/23.
//

import Foundation
import UIKit

class VideoPlayerLayouts {
    
    static let shared = VideoPlayerLayouts()
    
    private init() { }
    
    func newsDescription() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(120)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(120)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.top = 8.0
        
        return section
    }
    
    func newsLayoutSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1)))
        item.contentInsets = .init(top: 8, leading: 8, bottom: .zero, trailing: 8)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1/2)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.top = 8.0
        section.contentInsets.bottom = 8.0
        
        let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(32))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: FavoriteHeaderView.kind, alignment: .topLeading)
        section.boundarySupplementaryItems = [header]
        
        return section
    }
}
