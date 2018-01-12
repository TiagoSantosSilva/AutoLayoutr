//
//  UIImageViewExtension.swift
//  AutoLayoutr
//
//  Created by Tiago Santos on 12/01/18.
//  Copyright © 2018 Tiago Santos. All rights reserved.
//

import UIKit

extension UIImageView {
    func setImageViewConstraints(xAnchor: NSLayoutXAxisAnchor, yAnchor: NSLayoutYAxisAnchor,
                                 topAnchorConstant: CGFloat, widthAnchor: CGFloat, heightAnchor: CGFloat) {
        
        // enables autolayout for the image view
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.centerXAnchor.constraint(equalTo: xAnchor).isActive = true
        self.topAnchor.constraint(equalTo: yAnchor, constant: topAnchorConstant).isActive = true
        self.widthAnchor.constraint(equalToConstant: widthAnchor).isActive = true
        self.heightAnchor.constraint(equalToConstant: heightAnchor).isActive = true
    }
}
