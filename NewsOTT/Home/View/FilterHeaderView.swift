//
//  FilterHeaderView.swift
//  NewsOTT
//
//  Created by Khaled on 25/10/23.
//

import UIKit

extension FilterHeaderView {
    class Callback {
    var didTappedLatest: () -> Void = { }
    var didTappedPopular: () -> Void = { }
    var didTappedOldest: () -> Void = { }
    var didTappedFilter: () -> Void = { }
    }
}

class FilterHeaderView: UICollectionReusableView {
    static let identifier = "FilterHeaderView"
    static let kind = "FilterHeaderViewElementKind"
    
    @IBOutlet private weak var customView: UIView!
    @IBOutlet private weak var latestButtonOutlet: UIButton!
    @IBOutlet private weak var popularButtonOutlet: UIButton!
    @IBOutlet private weak var oldestButtonOutlet: UIButton!
    @IBOutlet private weak var filterButtonOutlet: UIButton!
    @IBOutlet private var filterButtons: [UIButton]!
    
    private let filtetColor = UIColor(red: 0, green: 43/255, blue: 182/255, alpha: 1)
    
    let callback = Callback()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    @IBAction private func didTappedLatest(_ sender: UIButton) {
        sender.pulse()
        filterButtons.forEach({ button in
            if button.tag == 1 {
                button.backgroundColor = filtetColor
                callback.didTappedLatest()
            } else {
                button.backgroundColor = .clear
            }
        })
    }
    
    @IBAction private func didTappedPopular(_ sender: UIButton) {
        sender.pulse()
        filterButtons.forEach({ button in
            if button.tag == 2 {
                button.backgroundColor = filtetColor
                callback.didTappedPopular()
            } else {
                button.backgroundColor = .clear
            }
        })
    }
    
    @IBAction private func didTappedOldest(_ sender: UIButton) {
        sender.pulse()
        filterButtons.forEach({ button in
            if button.tag == 3 {
                button.backgroundColor = filtetColor
                callback.didTappedOldest()
            } else {
                button.backgroundColor = .clear
            }
        })
    }
    
    @IBAction private func didTappedFilter(_ sender: UIButton) {
        sender.pulse()
        callback.didTappedFilter()
    }
    
    private func setupViews() {
        customView.backgroundColor = .appPrimary
        latestButtonOutlet.backgroundColor = filtetColor
        filterButtonOutlet.backgroundColor = filtetColor

        backgroundColor = filtetColor
       /* 
        latestButtonOutlet.setTitle("latest-filter-str".localizableString(UserDefaultsManager.shared.getString(forkey: "localization-language") ?? "en"), for: .normal)
        oldestButtonOutlet.setTitle("oldest-filter-str".localizableString(UserDefaultsManager.shared.getString(forkey: "localization-language") ?? "en"), for: .normal)
        popularButtonOutlet.setTitle("popular-filter-str".localizableString(UserDefaultsManager.shared.getString(forkey: "localization-language") ?? "en"), for: .normal)
        */
        [filterButtonOutlet, latestButtonOutlet, popularButtonOutlet, oldestButtonOutlet].forEach { button in
            button?.layer.cornerRadius = 10.0
        }
        
        [latestButtonOutlet, popularButtonOutlet, oldestButtonOutlet].forEach { button in
            button?.layer.borderWidth = 1.0
            button?.layer.borderColor = filtetColor.cgColor
        }
    }
}
