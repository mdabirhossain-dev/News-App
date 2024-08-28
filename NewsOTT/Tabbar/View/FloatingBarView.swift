//
//  FloatingBarView.swift
//  NewsOTT
//
//  Created by Khaled on 20/9/23.
//

import Foundation
import UIKit

protocol FloatingBarViewDelegate: AnyObject {
    func did(selectindex: Int)
}

class FloatingBarView: UIView {
    private var buttons: [UIButton] = []
    weak var delegate: FloatingBarViewDelegate?
    var didTappedBinge: () -> Void = { }
    
    init(_ items: [TabbarItem]) {
        super.init(frame: .zero)
        setupStackView(items)
        setupViews()
    }
    
    private func setupViews() {
        updateUI(selectedIndex: .zero)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addBackground()
    }
    
    private func addBackground() {
        backgroundColor = UIColor(red: 0.035, green: 0.122, blue: 0.349, alpha: 1)
        addTopBorderWithColor(UIColor(red: 99/255, green: 130/255, blue: 214/255, alpha: 1), width: 2.0)
    }
    
    private func setupStackView(_ items: [TabbarItem]) {
        for (index, item) in items.enumerated() {
            
            let button = createButton(title: item.title,
                                      normalImage: item.image ?? UIImage(),
                                      selectedImage: item.selectedImage ?? UIImage(),
                                      index: index,
                                      isLeadingImage: index == .zero ? true : false,
                                      isRoundImage: index == 3 ? true : false)
            buttons.append(button)
        }
        
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.distribution = .fillEqually
        stackView.clipsToBounds = true
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 12, left: 16, bottom: 12, right: 16))
    }
    
    private func createButton(title: String,
                              normalImage: UIImage,
                              selectedImage: UIImage,
                              index: Int,
                              isLeadingImage: Bool,
                              isRoundImage: Bool) -> UIButton {
        let button = CustomButton()
        button.setImage(normalImage, for: .normal)
        button.setImage(selectedImage, for: .selected)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 10, weight: .bold)
        button.tag = index
        button.isleadingImage = isLeadingImage
        button.isRoundImage = isRoundImage
        button.adjustsImageWhenHighlighted = false
        button.addTarget(self, action: #selector(changeTab(_:)), for: .touchUpInside)
        return button
    }
    
    @objc private func changeTab(_ sender: UIButton) {
        sender.pulse()
        delegate?.did(selectindex: sender.tag)
        updateUI(selectedIndex: sender.tag)
    }
    
   private func updateUI(selectedIndex: Int) {
        for (index, button) in buttons.enumerated() {
            if index == selectedIndex {
                button.isSelected = true
                button.backgroundColor = UIColor(red: 18/255, green: 44/255, blue: 129/255, alpha: 1)
                
                let shadowPath = UIBezierPath(roundedRect: button.bounds, cornerRadius: 9)
                button.layer.shadowPath = shadowPath.cgPath
                button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
                button.layer.shadowOpacity = 1
                button.layer.shadowRadius = 6
                button.layer.shadowOffset = CGSize(width: 0, height: 0)
                      
                button.setTitleColor(.white, for: .normal)
            } else {
                button.isSelected = false
                button.backgroundColor = .clear
                button.layer.shadowOpacity = 0
                button.setTitleColor(.clear, for: .normal)
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func toggle(hide: Bool) {
        if !hide {
            isHidden = hide
        }
        
        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 1,
                       initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.alpha = hide ? 0 : 1
            self.transform = hide ? CGAffineTransform(translationX: 0, y: 10) : .identity
        }) { (_) in
            if hide {
                self.isHidden = hide
            }
        }
    }
}
