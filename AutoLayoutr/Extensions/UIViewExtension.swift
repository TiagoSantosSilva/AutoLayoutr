//
//  UIViewExtension.swift
//  AutoLayoutr
//
//  Created by Tiago Santos on 13/01/18.
//  Copyright © 2018 Tiago Santos. All rights reserved.
//

import UIKit

extension UIView {
    func setupUIViewConstraints(topAnchor: NSLayoutYAxisAnchor, leadingAnchor: NSLayoutXAxisAnchor, trailingAnchor: NSLayoutXAxisAnchor,
                                heightAnchor: NSLayoutDimension, heightAnchorMultiplier: CGFloat) {
        self.topAnchor.constraint(equalTo: topAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        self.heightAnchor.constraint(equalTo: heightAnchor, multiplier: heightAnchorMultiplier).isActive = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
