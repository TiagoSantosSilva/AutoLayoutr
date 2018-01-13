//
//  UITextViewExtension.swift
//  AutoLayoutr
//
//  Created by Tiago Santos on 12/01/18.
//  Copyright © 2018 Tiago Santos. All rights reserved.
//

import UIKit

extension UITextView {
    func setupTextView(headerText: String, bodyText: String) {
        let attributedText = NSMutableAttributedString(string: headerText, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
        
        attributedText.append(NSAttributedString(string: "\n\n\n\(bodyText)",
                                                 attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13),
                                                              NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)]))
            
        self.attributedText = attributedText
    }
    
    func setupTextViewAnchors(topAnchor: NSLayoutYAxisAnchor, leftAnchor: NSLayoutXAxisAnchor, rightAnchor: NSLayoutXAxisAnchor,
                              bottomAnchor: NSLayoutYAxisAnchor, bottomAnchorConstant: CGFloat) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: topAnchor).isActive = true
        self.leftAnchor.constraint(equalTo: leftAnchor, constant: 25).isActive = true
        self.rightAnchor.constraint(equalTo: rightAnchor, constant: -25).isActive = true
        self.bottomAnchor.constraint(equalTo: bottomAnchor, constant: bottomAnchorConstant).isActive = true
    }
}
