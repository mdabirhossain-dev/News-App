//
//  FavoriteHeaderView.swift
//  NewsOTT
//
//  Created by Khaled on 22/10/23.
//

import UIKit

class FavoriteHeaderView: UICollectionReusableView {
    static let identifier = "FavoriteHeaderView"
    static let kind = "ElementKind"
    
    @IBOutlet private weak var customView: UIView!
    @IBOutlet private weak var headerTitle: UILabel!
    @IBOutlet private weak var headerBottomLine: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        headerBottomLine.backgroundColor = UIColor(red: 0, green: 43/255, blue: 182/255, alpha: 1)
        headerTitle.font = .poppins(.medium_500, size: 20.0)
    }
}
