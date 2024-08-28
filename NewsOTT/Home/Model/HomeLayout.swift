//
//  HomeLayout.swift
//  NewsOTT
//
//  Created by Khaled on 26/10/23.
//

import Foundation
import UIKit

class HomeLayout {
    
    static let shared = HomeLayout()
    private init() { }
    
    func autoScrollingSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(40)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(40)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.leading = 8.0
        section.contentInsets.trailing = 8.0
        
        return section
    }
    
    func newsLayoutSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1)))
        item.contentInsets = .init(top: 8, leading: 8, bottom: .zero, trailing: 8)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1/2)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.top = 8.0
        section.contentInsets.bottom = 8.0
        
        let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(40))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: FilterHeaderView.kind, alignment: .topLeading)
        header.pinToVisibleBounds = true
        section.boundarySupplementaryItems = [header]
        
        return section
    }
}
