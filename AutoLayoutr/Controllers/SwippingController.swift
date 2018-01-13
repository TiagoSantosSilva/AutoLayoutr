//
//  SwippingController.swift
//  AutoLayoutr
//
//  Created by Tiago Santos on 13/01/18.
//  Copyright © 2018 Tiago Santos. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class SwippingController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
    }
}
