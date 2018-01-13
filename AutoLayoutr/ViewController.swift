//
//  ViewController.swift
//  AutoLayoutr
//
//  Created by Tiago Santos on 12/01/18.
//  Copyright © 2018 Tiago Santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var bearImageView: UIImageView!
    var descriptionTextView: UITextView!
    var topImageContainerView: UIView!
    var previousButton: UIButton!
    var bottomControlsStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        setupLayout()
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
}

extension ViewController {
    
    fileprivate func setupLayout() {
        setupTopImageContainerView()
        setupBearImageView()
        setupDescriptionTextView()
        setupBottomControls()
    }
    
    fileprivate func setupBottomControls() {
        let yellowView = UIView()
        yellowView.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        
        let blueView = UIView()
        blueView.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [yellowView, blueView])
        view.addSubview(bottomControlsStackView)
        bottomControlsStackView.setupUIViewConstraints(bottomAnchor: view.safeAreaLayoutGuide.bottomAnchor, leadingAnchor: view.safeAreaLayoutGuide.leadingAnchor, trailingAnchor: view.safeAreaLayoutGuide.trailingAnchor, heightConstant: 50)
        bottomControlsStackView.distribution = .fillEqually
        // setupPreviousButton()
    }
    
    fileprivate func setupPreviousButton() {
        previousButton = UIButton(type: .system)
        previousButton.setupButtonBackgroundColorTitleType(backgroundColor: #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1), title: "Prev", type: .normal)
        previousButton.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        view.addSubview(previousButton)
        previousButton.setButtonAnchors(bottomAnchor: view.safeAreaLayoutGuide.bottomAnchor, leadingAnchor: view.safeAreaLayoutGuide.leadingAnchor, trailingAnchor: view.safeAreaLayoutGuide.trailingAnchor, heightConstant: 50)
    }
    
    fileprivate func setupTopImageContainerView() {
        topImageContainerView = UIView()
        setupImageContainerViewConstraints()
    }
    
    fileprivate func setupBearImageView() {
        bearImageView = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        topImageContainerView.addSubview(bearImageView)
        bearImageView.setImageViewConstraints(xAnchor: topImageContainerView.centerXAnchor, yAnchor: topImageContainerView.centerYAnchor, heightAnchor: topImageContainerView.heightAnchor, multiplier: 0.5)
    }
    
    fileprivate func setupImageContainerViewConstraints() {
        topImageContainerView.backgroundColor = UIColor.clear
        topImageContainerView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        view.addSubview(topImageContainerView)
        topImageContainerView.setupUIViewConstraints(topAnchor: view.topAnchor, leadingAnchor: view.leadingAnchor, trailingAnchor: view.trailingAnchor, heightAnchor: view.heightAnchor, heightAnchorMultiplier: 0.5)
    }
    
    fileprivate func setupDescriptionTextView() {
        descriptionTextView = UITextView()
        view.addSubview(descriptionTextView)
        descriptionTextView.setupTextView(text: "Join us today in our fun and games!")
        descriptionTextView.textAlignment = .center
        descriptionTextView.isEditable = false
        descriptionTextView.isScrollEnabled = false
        descriptionTextView.setupTextViewAnchors(topAnchor: topImageContainerView.bottomAnchor, leftAnchor: view.leftAnchor, rightAnchor: view.rightAnchor, bottomAnchor: view.bottomAnchor, bottomAnchorConstant: 0)
    }
}
