//
//  UITextViewExtension.swift
//  AutoLayoutr
//
//  Created by Tiago Santos on 12/01/18.
//  Copyright © 2018 Tiago Santos. All rights reserved.
//

import UIKit

extension UITextView {
    func setupTextView(text: String) {
        self.text = text
    }
    
    func setupTextViewAnchors(topAnchor: NSLayoutYAxisAnchor, topAnchorConstant: CGFloat, leftAnchor: NSLayoutXAxisAnchor, rightAnchor: NSLayoutXAxisAnchor,
                              bottomAnchor: NSLayoutYAxisAnchor, bottomAnchorConstant: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: topAnchor, constant: topAnchorConstant).isActive = true
        self.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        self.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: bottomAnchor, constant: bottomAnchorConstant).isActive = true
    }
}
