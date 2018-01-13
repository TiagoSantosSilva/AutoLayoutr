//
//  SwipingController.swift
//  AutoLayoutr
//
//  Created by Tiago Santos on 13/01/18.
//  Copyright © 2018 Tiago Santos. All rights reserved.
//

import UIKit

let reuseIdentifier = "cellId"

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    internal var previousButton: UIButton!
    internal var nextButton: UIButton!
    internal var bottomControlsStackView: UIStackView!
    internal var pageControl: UIPageControl!
    
    let pages = [
        Page(imageName: "bear_first", headerText: "Join us today in our fun and games!", bodyText: "Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon."),
        Page(imageName: "heart_second", headerText: "Subscribe and get coupons on our daily events", bodyText: "Get notified of the savings immediatily when we announce them on our website. Make sure to also give us any feedback you have."),
        Page(imageName: "leaf_third", headerText: "VIP members special services", bodyText: "Join the private club of elite customers will get you into select drawings and giveaways.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBottomControls()
        
        collectionView?.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        collectionView?.isPagingEnabled = true
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            
            if self.pageControl.currentPage == 0 {
                self.collectionView?.contentOffset = .zero
            } else {
                let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
                self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
        }, completion: nil)
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
}

extension SwipingController {
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let targetXPointee = targetContentOffset.pointee.x
        let currentCollectionViewCell = Int(targetXPointee / view.frame.width)
        pageControl.currentPage = currentCollectionViewCell
    }
}

