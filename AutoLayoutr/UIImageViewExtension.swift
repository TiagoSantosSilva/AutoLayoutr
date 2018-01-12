//
//  UIImageViewExtension.swift
//  AutoLayoutr
//
//  Created by Tiago Santos on 12/01/18.
//  Copyright © 2018 Tiago Santos. All rights reserved.
//

import UIKit

extension UIImageView {
    func setImageViewConstraints(xAnchor: NSLayoutXAxisAnchor, yAnchor: NSLayoutYAxisAnchor, heightAnchor: NSLayoutDimension, multiplier: CGFloat) {
        
        // enables autolayout for the image view
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentMode = .scaleAspectFit
        self.centerXAnchor.constraint(equalTo: xAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: yAnchor).isActive = true
        self.heightAnchor.constraint(equalTo: heightAnchor, multiplier: multiplier).isActive = true
    }
}
