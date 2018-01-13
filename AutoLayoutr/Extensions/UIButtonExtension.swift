//
//  UIButtonExtension.swift
//  AutoLayoutr
//
//  Created by Tiago Santos on 13/01/18.
//  Copyright © 2018 Tiago Santos. All rights reserved.
//

import UIKit

extension UIButton {
    func setupButtonBackgroundColorTitleType(backgroundColor: UIColor, title: String, type: UIControlState) {
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: type)
    }
    
    func setButtonAnchors(topAnchor: NSLayoutYAxisAnchor, leadingAnchor: NSLayoutXAxisAnchor, trailingAnchor: NSLayoutXAxisAnchor, heightConstant: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: topAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        self.heightAnchor.constraint(equalToConstant: heightConstant).isActive = true
    }
}
