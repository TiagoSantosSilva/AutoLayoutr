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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        setupLayout()
    }
    
    fileprivate func setupLayout() {
        topImageContainerView = UIView()
        topImageContainerView.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        topImageContainerView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        view.addSubview(topImageContainerView)
        
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        setupBearImageView()
        setupDescriptionTextView()
    }
    
    fileprivate func setupBearImageView() {
        bearImageView = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        topImageContainerView.addSubview(bearImageView)
        bearImageView.setImageViewConstraints(xAnchor: topImageContainerView.centerXAnchor, yAnchor: topImageContainerView.centerYAnchor, heightAnchor: topImageContainerView.heightAnchor, multiplier: 0.5)
    }
    
    fileprivate func setupDescriptionTextView() {
        descriptionTextView = UITextView()
        view.addSubview(descriptionTextView)
        descriptionTextView.setupTextView(text: "Join us today in our fun and games!")
        descriptionTextView.font = UIFont.boldSystemFont(ofSize: 18)
        descriptionTextView.textAlignment = .center
        descriptionTextView.isEditable = false
        descriptionTextView.isScrollEnabled = false
        descriptionTextView.setupTextViewAnchors(topAnchor: topImageContainerView.bottomAnchor, leftAnchor: view.leftAnchor, rightAnchor: view.rightAnchor, bottomAnchor: view.bottomAnchor, bottomAnchorConstant: 0)
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
}
