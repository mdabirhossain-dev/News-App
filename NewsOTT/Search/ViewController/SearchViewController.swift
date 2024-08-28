//
//  SearchViewController.swift
//  NewsOTT
//
//  Created by Tanvir Rahman on 30/10/23.
//

import Foundation
import UIKit
import SwiftUI

class SearchViewController: UIViewController {
    private var hostingController: UIHostingController<SearchView>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "search-title-str".localizableString(UserDefaultsManager.shared.getString(forkey: "localization-language") ?? "en")
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.backgroundColor = .appPrimary
    }
    
    private func setupViews() {
        
        view.backgroundColor = .appPrimary
        setupNavBar()
        setupSearchView()
    }
    
    private func setupNavBar() {
        let notificationButton = UIBarButtonItem(image: .notification, style: .plain, target: self, action: #selector(didTappedNotification))
        let castButton = UIBarButtonItem(image: .cast, style: .plain, target: self, action: #selector(didTappedCast))
        
        [notificationButton, castButton].forEach { button in
            button.tintColor = .white
        }
        self.navigationItem.rightBarButtonItems = [notificationButton, castButton]
    }
    
    @objc private func didTappedNotification() {
        print("did tapped notification")
    }
    
    @objc private func didTappedCast() {
        SharedAirplay.shared.showAirPlayMenu(view: view)
    }
    
    private func setupSearchView() {
        hostingController = UIHostingController(rootView: SearchView())
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(hostingController.view)
        
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
