//
//  FavoriteViewController.swift
//  NewsOTT
//
//  Created by Khaled on 18/10/23.
//

import Foundation
import UIKit
import MediaPlayer
class FavoriteViewController: UIViewController {
    @IBOutlet private weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.collectionViewLayout = favoriteVideosLayout()
            collectionView.registerNibCell(FavoriteCollectionViewCell.self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "favourite-title-str".localizableString(UserDefaultsManager.shared.getString(forkey: "localization-language") ?? "en")
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.backgroundColor = .appPrimary
    }
    
    private func setupView() {
        view.backgroundColor = .appPrimary
        let bottomInset: CGFloat = 75.0
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: bottomInset, right: 0)
        setupNavBar()
    }
    
    private func setupNavBar() {
        let notificationButton = UIBarButtonItem(image: .notification, style: .plain, target: self, action: #selector(didTappedNotification))
        let castButton = UIBarButtonItem(image: .cast, style: .plain, target: self, action: #selector(didTappedCast))
        notificationButton.tintColor = .white
        castButton.tintColor = .white
        
        self.navigationItem.rightBarButtonItems = [notificationButton, castButton]
    }
    
    @objc private func didTappedNotification() {
        print("did tapped notification")
    }
    
    @objc private func didTappedCast() {
        SharedAirplay.shared.showAirPlayMenu(view: view)
    }
    
    func favoriteVideosLayout() -> UICollectionViewCompositionalLayout {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1)))
        item.contentInsets = .init(top: 8, leading: 8, bottom: .zero, trailing: 8)

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1/2)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.top = 8.0
        section.contentInsets.bottom = 8.0
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    private func setupCustomPlayer() {
        let vc = DetailPlayerViewController.instantiate()
        guard let url = NSURL(string: "http://clips.vorwaerts-gmbh.de/VfE_html5.mp4") else { return }
        CustomPlayer.initCustomPlayer(url: url)
        CustomPlayer.showCustomPlayerView(viewController: vc)
    }
}

extension FavoriteViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as FavoriteCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
        
        if CustomPlayer.getPlayerViewController() != nil {
            guard let url = NSURL(string: "http://clips.vorwaerts-gmbh.de/VfE_html5.mp4") else { return }
            CustomPlayer.changeURL(url: url)
            CustomPlayer.expandView(expand: true)
        } else {
            setupCustomPlayer()
        }
        let vc = DetailPlayerViewController.instantiate()
        vc.isTV = false
        CustomPlayer.isLive(isLive: false)
        CustomPlayer.add_ViewController(viewController: vc)
    }
}

extension FavoriteViewController: StoryboardBased {
    static var storyboardName: String {
        return "Favorite"
    }
}
