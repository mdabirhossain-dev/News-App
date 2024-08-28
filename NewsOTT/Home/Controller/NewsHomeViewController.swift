//
//  NewsHomeViewController.swift
//  NewsOTT
//
//  Created by Khaled on 23/10/23.
//

import Foundation
import UIKit

class NewsHomeViewController: UIViewController {
    @IBOutlet private weak var collectionview: UICollectionView! {
        didSet {
            collectionview.collectionViewLayout = UICollectionViewLayout()
            collectionview.delegate = self
            collectionview.dataSource = self
        }
    }
    
    @IBOutlet private weak var scrollView: EFAutoScrollLabel! {
        didSet {
            scrollView.attributedText = attributedTextWithCirclePointAndBreakingNews(breakingNews: breakingNews)
            scrollView.font = .poppins(.regular_400, size: 16.0)
            scrollView.labelSpacing = UIScreen.main.bounds.width
            scrollView.pauseInterval = 1.7
            scrollView.scrollSpeed = 30
            scrollView.textAlignment = NSTextAlignment.left
            scrollView.fadeLength = 12
            scrollView.scrollDirection = EFAutoScrollDirection.left
            scrollView.isUserInteractionEnabled = false
        }
    }
    
    private let transitionManager = MenuTransitionManager()
    private var newsInfo = [NewsInfos]()
    private let breakingNews = "If you’re just joining us, two more UN Security Council resolutions failed on Wednesday, as the members could not agree on a ceasefire."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.backgroundColor = .appPrimary
        scrollView.attributedText = attributedTextWithCirclePointAndBreakingNews(breakingNews: breakingNews)
    }
    
    private func setupViews() {
        view.backgroundColor = .appPrimary
        setupNavBar()
        setupCollectionView()
    }
    
    private func setupNavBar() {
        let menuButton = UIBarButtonItem(image: .manu, style: .plain, target: self, action: #selector(didTappedMenu))
        let notificationButton = UIBarButtonItem(image: .notification, style: .plain, target: self, action: #selector(didTappedNotification))
        let castButton = UIBarButtonItem(image: .cast, style: .plain, target: self, action: #selector(didTappedCast))
        
        [menuButton, notificationButton, castButton].forEach { button in
            button.tintColor = .white
        }
        self.navigationItem.rightBarButtonItems = [notificationButton, castButton]
        self.navigationItem.leftBarButtonItem = menuButton
    }
    
    @objc private func didTappedMenu() {
        print("did Tapped Menu")
        let menuVC =  MewsMenuViewController.instantiate()
        menuVC.modalPresentationStyle = .custom
        menuVC.transitioningDelegate = transitionManager
        
        present(menuVC, animated: true, completion: nil)
    }
    
    @objc private func didTappedNotification() {
        print("did tapped notification")
    }
    
    @objc private func didTappedCast() {
        SharedAirplay.shared.showAirPlayMenu(view: view)
    }
    
    private func setupCollectionView() {
        collectionview.backgroundColor = .appPrimary
        collectionview.bounces = true
        let bottomInset: CGFloat = 75.0
        collectionview.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: bottomInset, right: 0)
        collectionview.registerNibCell(NewsViedeoCollectionViewCell.self)
        collectionview.registerNibCell(AutoScrollingCollectionViewCell.self)
        collectionview.register(UINib(nibName: FilterHeaderView.identifier, bundle: nil),
                                forSupplementaryViewOfKind: FilterHeaderView.kind,
                                withReuseIdentifier: FilterHeaderView.identifier)
        self.newsInfo.removeAll()
        self.newsInfo.append(contentsOf: latest)
        configureCompositionalLayout()
    }
    
    private func configureCompositionalLayout() {
        let layout = UICollectionViewCompositionalLayout {sectionIndex,enviroment in
            switch sectionIndex {
            default:
                return HomeLayout.shared.newsLayoutSection()
            }
        }
        collectionview.setCollectionViewLayout(layout, animated: false)
    }
    
    
    private func setupCustomPlayer() {
        let vc = DetailPlayerViewController.instantiate()
        guard let url = NSURL(string: "http://clips.vorwaerts-gmbh.de/VfE_html5.mp4") else { return }
        CustomPlayer.initCustomPlayer(url: url)
        CustomPlayer.showCustomPlayerView(viewController: vc)
    }
    
    private func attributedTextWithCirclePointAndBreakingNews(breakingNews: String) -> NSAttributedString {
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

extension NewsHomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = NewsViedeoCollectionViewCell.dequeue(from: collectionView, at: indexPath)
        cell.viewModel = .init(newsThumbnail: newsInfo[indexPath.item].newsThumbnail,
                               newsTitle: newsInfo[indexPath.item].newsTitle,
                               watched: newsInfo[indexPath.item].watched,
                               publishTime: newsInfo[indexPath.item].publishTime)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case FilterHeaderView.kind:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FilterHeaderView.identifier, for: indexPath) as! FilterHeaderView
          
            header.callback.didTappedFilter = {
                print("did tapped filter")
            }
            header.callback.didTappedLatest = {[weak self] in
                print("did tapped latest")
                self?.newsInfo.removeAll()
                self?.newsInfo.append(contentsOf: latest)
                collectionView.reloadData()
            }
            header.callback.didTappedPopular = {[weak self] in
                print("did tapped poluper")
                self?.newsInfo.removeAll()
                self?.newsInfo.append(contentsOf: popular)
                collectionView.reloadData()
            }
            header.callback.didTappedOldest = {[weak self] in
                print("did tapped oldest")
                self?.newsInfo.removeAll()
                self?.newsInfo.append(contentsOf: oldest)
                collectionView.reloadData()
            }
            return header
        default :
            return UICollectionReusableView()
        }
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

extension NewsHomeViewController: StoryboardBased {
    static var storyboardName: String {
        return "Home"
    }
}
