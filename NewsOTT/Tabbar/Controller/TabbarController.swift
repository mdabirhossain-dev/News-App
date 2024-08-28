//
//  TabbarController.swift
//  NewsOTT
//
//  Created by Khaled on 20/9/23.
//

import Foundation
import UIKit
import SwiftUI

class TabBarContoller: UITabBarController {
    let floatingTabbarView = FloatingBarView(TabbarItem.allCases)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        viewControllers = [
            createNavViewController(viewController: NewsHomeViewController.instantiate()),
            createNavViewController(viewController: SearchViewController()),
            createNavViewController(viewController: FavoriteViewController.instantiate()),
            createNavViewController(viewController: ProfileViewController())
        ]
        tabBar.isHidden = true
        setupFloatingTabBar()
        floatingTabbarView.didTappedBinge = {[weak self] in
            self?.selectedIndex = 2
        }
    }

    private func createNavViewController(viewController: UIViewController) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        return navController
    }

   private func setupFloatingTabBar() {
        floatingTabbarView.delegate = self
        view.addSubview(floatingTabbarView)
        floatingTabbarView.centerXInSuperview()
       
        NSLayoutConstraint.activate([
            floatingTabbarView.heightAnchor.constraint(equalToConstant: 70),
            floatingTabbarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .zero),
            floatingTabbarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:.zero ),
            floatingTabbarView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: .zero)
        ])
    }
    
    func toggle(hide: Bool) {
        floatingTabbarView.toggle(hide: hide)
    }
}

extension TabBarContoller: FloatingBarViewDelegate {
    func did(selectindex: Int) {
        selectedIndex = selectindex
    }
}

