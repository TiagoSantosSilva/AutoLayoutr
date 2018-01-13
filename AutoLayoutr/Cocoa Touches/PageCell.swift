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
        topImageContainerView.backgroundColor = .clear
        topImageContainerView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        addSubview(topImageContainerView)
        topImageContainerView.setupUIViewConstraints(topAnchor: topAnchor, leadingAnchor: leadingAnchor, trailingAnchor: trailingAnchor, heightAnchor: heightAnchor, heightAnchorMultiplier: 0.5)
    }
    
    fileprivate func setupDescriptionTextView(unwrappedPage: Page) {
        descriptionTextView = UITextView()
        descriptionTextView.backgroundColor = .clear
        addSubview(descriptionTextView)
        
        descriptionTextView.setupTextView(headerText: unwrappedPage.headerText, bodyText: unwrappedPage.bodyText)
        descriptionTextView.textAlignment = .center
        descriptionTextView.isEditable = false
        descriptionTextView.isScrollEnabled = false
        descriptionTextView.setupTextViewAnchors(topAnchor: topImageContainerView.bottomAnchor, leftAnchor: leftAnchor, rightAnchor: rightAnchor, bottomAnchor: bottomAnchor, bottomAnchorConstant: 0)
    }
}
