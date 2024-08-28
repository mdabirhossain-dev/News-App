//
//  ProfileViewController.swift
//  NewsOTT
//
//  Created by Khaled on 26/10/23.
//

import Foundation
import UIKit
import SwiftUI

class ProfileViewController: UIViewController {
    private var hostingController: UIHostingController<ProfileContentView>!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupProfileView()
        view.backgroundColor = .appPrimary
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.backgroundColor = .appPrimary
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func setupProfileView() {
        hostingController = UIHostingController(rootView: ProfileContentView())
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.backgroundColor = .appPrimary
        view.addSubview(hostingController.view)

        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        addChild(hostingController)
        hostingController.didMove(toParent: self)
    }
}
