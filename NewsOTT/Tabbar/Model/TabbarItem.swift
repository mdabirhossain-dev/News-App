//
//  TabbarItem.swift
//  NewsOTT
//
//  Created by Khaled on 20/9/23.
//

import Foundation
import UIKit

enum TabbarItem: CaseIterable {
    case home
    case search
    case favorite
    case profile
    
    var title: String {
        switch self {
        case .home:
            return "HOME"
        case .search:
            return "SEARCH"
        case .favorite:
            return "FAVORITE"
        case .profile:
            return "PROFILE"
        }
    }
    
    var image: UIImage? {
        switch self {
        case .home:
            return .home
        case .search:
            return .search
        case .favorite:
            return .favorite
        case .profile:
            return .profile
        }
    }
    
    var selectedImage: UIImage? {
        switch self {
        case .home:
            return .home
        case .search:
            return .search
        case .favorite:
            return .favorite
        case .profile:
            return .profile
        }
    }
}
