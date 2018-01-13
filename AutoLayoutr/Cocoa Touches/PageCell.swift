//
//  PageCell.swift
//  AutoLayoutr
//
//  Created by Tiago Santos on 13/01/18.
//  Copyright © 2018 Tiago Santos. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            guard let unwrappedPage = page else { return }
            
            setupBearImageView(unwrappedPage: unwrappedPage)
            setupDescriptionTextView(unwrappedPage: unwrappedPage)
        }
    }

    private var bearImageView: UIImageView!
    private var descriptionTextView: UITextView!
    private var topImageContainerView: UIView!
    private var previousButton: UIButton!
    private var nextButton: UIButton!
    private var bottomControlsStackView: UIStackView!
    private var pageControl: UIPageControl!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PageCell {
    fileprivate func setupLayout() {
        setupTopImageContainerView()
        setupBottomControls()
    }
    
    fileprivate func setupBottomControls() {
        previousButton = setupBottomButton(title: "PREV", titleColor: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
        nextButton = setupBottomButton(title: "NEXT", titleColor: .mainPink)
        pageControl = setupBottomPageControl()
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        addSubview(bottomControlsStackView)
        bottomControlsStackView.setupUIViewConstraints(bottomAnchor: safeAreaLayoutGuide.bottomAnchor, leadingAnchor: safeAreaLayoutGuide.leadingAnchor, trailingAnchor: safeAreaLayoutGuide.trailingAnchor, heightConstant: 50)
        bottomControlsStackView.distribution = .fillEqually
        
    }
    
    fileprivate func setupBottomPageControl() -> UIPageControl {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.numberOfPages = 4
        pageControl.currentPageIndicatorTintColor = .mainPink
        pageControl.pageIndicatorTintColor = .fadedPink
        return pageControl
    }
    
    fileprivate func setupBottomButton(title: String, titleColor: UIColor) -> UIButton {
        let button = UIButton(type: .system)
        button.setupButtonBackgroundColorTitleType(backgroundColor: .clear, title: title, type: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(titleColor, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        return button
    }
    
    fileprivate func setupTopImageContainerView() {
        topImageContainerView = UIView()
        setupImageContainerViewConstraints()
    }
    
    fileprivate func setupBearImageView(unwrappedPage: Page) {
        bearImageView = UIImageView(image: UIImage(named: unwrappedPage.imageName))
        topImageContainerView.addSubview(bearImageView)
        bearImageView.setImageViewConstraints(xAnchor: topImageContainerView.centerXAnchor, yAnchor: topImageContainerView.centerYAnchor, heightAnchor: topImageContainerView.heightAnchor, multiplier: 0.5)
    }
    
    fileprivate func setupImageContainerViewConstraints() {
        topImageContainerView.backgroundColor = UIColor.clear
        topImageContainerView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        addSubview(topImageContainerView)
        topImageContainerView.setupUIViewConstraints(topAnchor: topAnchor, leadingAnchor: leadingAnchor, trailingAnchor: trailingAnchor, heightAnchor: heightAnchor, heightAnchorMultiplier: 0.5)
    }
    
    fileprivate func setupDescriptionTextView(unwrappedPage: Page) {
        descriptionTextView = UITextView()
        addSubview(descriptionTextView)
        
        descriptionTextView.setupTextView(headerText: unwrappedPage.headerText, bodyText: unwrappedPage.bodyText)
        descriptionTextView.textAlignment = .center
        descriptionTextView.isEditable = false
        descriptionTextView.isScrollEnabled = false
        descriptionTextView.setupTextViewAnchors(topAnchor: topImageContainerView.bottomAnchor, leftAnchor: leftAnchor, rightAnchor: rightAnchor, bottomAnchor: bottomAnchor, bottomAnchorConstant: 0)
    }
}
