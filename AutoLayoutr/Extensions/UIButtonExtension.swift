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
}
