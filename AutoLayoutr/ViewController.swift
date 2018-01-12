//
//  ViewController.swift
//  AutoLayoutr
//
//  Created by Tiago Santos on 12/01/18.
//  Copyright © 2018 Tiago Santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        let bearImageView = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        view.addSubview(bearImageView)
        bearImageView.setImageViewConstraints(xAnchor: view.centerXAnchor, yAnchor: view.topAnchor, topAnchorConstant: 100, widthAnchor: 200, heightAnchor: 200)
    }
}
