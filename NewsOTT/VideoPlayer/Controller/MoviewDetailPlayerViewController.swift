//
//  MoviewDetailPlayerViewController.swift
//  AmberIT
//
//  Created by Khaled on 2/10/23.
//

import Foundation
import UIKit

class DetailPlayerViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.collectionViewLayout = UICollectionViewFlowLayout()
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    
    private var selectedDescription: Int?
    private var selectedCategoryItems: Set<String> = []
    var isTV: Bool = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        isTV ? configureCompositionalLayoutForTV() :  configureCompositionalLayout()
    }
    
    var sections: [[SectionType]] {
        var newsDescription = [SectionType]()
        var newsRecommanded = [SectionType]()
        
        newsDescription = [.newsDescription]
        
        for _ in 0..<showInfos.count {
            newsRecommanded.append(contentsOf: [.newsRecommanded])
        }
        return [newsDescription, newsRecommanded]
    }
    
    
    private func setupViews() {
        view.backgroundColor = .appPrimary
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.backgroundColor = .appPrimary
        collectionView.registerNibCell(NewsDescriptionCollectionViewCell.self)
        collectionView.registerNibCell(NewsViedeoCollectionViewCell.self)
        
        collectionView.register(UINib(nibName: FavoriteHeaderView.identifier, bundle: nil),
                                forSupplementaryViewOfKind: FavoriteHeaderView.kind,
                                withReuseIdentifier: FavoriteHeaderView.identifier)
    }

    private func configureCompositionalLayout() {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            let sectionType: SectionType
            switch sectionIndex {
            case 0: sectionType = .newsDescription
            case 1: sectionType = .newsRecommanded
            default: sectionType = .newsRecommanded
            }
            return self.layout(for: sectionType)
        }
        collectionView.setCollectionViewLayout(layout, animated: false)
    }
    
    private func configureCompositionalLayoutForTV() {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            let sectionType: SectionType
            switch sectionIndex {
            case 0: sectionType = .newsDescription
            case 1: sectionType = .newsRecommanded
            default: sectionType = .newsRecommanded
            }
            return self.layout(for: sectionType)
        }
        collectionView.setCollectionViewLayout(layout, animated: false)
    }

    private func layout(for sectionType: SectionType) -> NSCollectionLayoutSection {
        switch sectionType {
        case .newsDescription:
            return VideoPlayerLayouts.shared.newsDescription()
        case .newsRecommanded:
            return VideoPlayerLayouts.shared.newsLayoutSection()
        }
    }
    
    private func scrollToSection(collectionView: UICollectionView, section: Int) {
        guard section >= 0 && section < collectionView.numberOfSections else {
            return
        }
        
        let indexPath = IndexPath(item: 0, section: section)
        collectionView.scrollToItem(at: indexPath, at: .centeredVertically, animated: true)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sections = sections[indexPath.section][indexPath.item]
        
        switch  sections {
        case .newsDescription:
            let cell = NewsDescriptionCollectionViewCell.dequeue(from: collectionView, at: indexPath)
            
            cell.callback.didTappedShare = {
                self.shareURL()
            }
            return cell
            
        case .newsRecommanded:
            let cell = NewsViedeoCollectionViewCell.dequeue(from: collectionView, at: indexPath)
            cell.viewModel = .init(newsThumbnail: showInfos[indexPath.item].newsThumbnail,
                                   newsTitle: showInfos[indexPath.item].newsTitle,
                                   watched: showInfos[indexPath.item].watched,
                                   publishTime: showInfos[indexPath.item].publishTime)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sections = sections[indexPath.section][indexPath.item]
        
        switch  sections {
        case .newsDescription: break
        case .newsRecommanded:
            guard let url = NSURL(string: "http://clips.vorwaerts-gmbh.de/VfE_html5.mp4") else { return }
            CustomPlayer.changeURL(url: url)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case FavoriteHeaderView.kind:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FavoriteHeaderView.identifier, for: indexPath) as! FavoriteHeaderView
            return header
        default :
            return UICollectionReusableView()
        }
    }
    
    func shareURL() {
        let shareVC = UIActivityViewController(activityItems: [URL(string: "https://mdabirhossain.com/")!], applicationActivities: nil)

        present(shareVC, animated: true)
    }
}

enum SectionType {
    case newsDescription
    case newsRecommanded
}

extension DetailPlayerViewController: StoryboardBased {
    static var storyboardName: String {
        return "Favorite"
    }
}
