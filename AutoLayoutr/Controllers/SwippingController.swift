//
//  SwipingController.swift
//  AutoLayoutr
//
//  Created by Tiago Santos on 13/01/18.
//  Copyright © 2018 Tiago Santos. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cellId"

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private var previousButton: UIButton!
    private var nextButton: UIButton!
    private var bottomControlsStackView: UIStackView!
    private var pageControl: UIPageControl!
    
    let pages = [
        Page(imageName: "bear_first", headerText: "Join us today in our fun and games!", bodyText: "Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon."),
        Page(imageName: "heart_second", headerText: "Subscribe and get coupons on our daily events", bodyText: "Get notified of the savings immediatily when we announce them on our website. Make sure to also give us any feedback you have."),
        Page(imageName: "leaf_third", headerText: "VIP members special services", bodyText: "Join the private club of elite customers will get you into select drawings and giveaways.s")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBottomControls()
        
        collectionView?.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        collectionView?.isPagingEnabled = true
    }
    
    fileprivate func setupBottomControls() {
        previousButton = setupBottomButton(title: "PREV", titleColor: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
        previousButton.addTarget(self, action: #selector(handlePrevButtonTapped), for: .touchUpInside)
        
        nextButton = setupBottomButton(title: "NEXT", titleColor: .mainPink)
        nextButton.addTarget(self, action: #selector(handleNextButtonTapped), for: .touchUpInside)
        
        pageControl = setupBottomPageControl()
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        view.addSubview(bottomControlsStackView)
        bottomControlsStackView.setupUIViewConstraints(bottomAnchor: view.safeAreaLayoutGuide.bottomAnchor, leadingAnchor: view.safeAreaLayoutGuide.leadingAnchor, trailingAnchor: view.safeAreaLayoutGuide.trailingAnchor, heightConstant: 50)
        bottomControlsStackView.distribution = .fillEqually
    }
    
    fileprivate func setupBottomPageControl() -> UIPageControl {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.numberOfPages = pages.count
        pageControl.currentPageIndicatorTintColor = .mainPink
        pageControl.pageIndicatorTintColor = .fadedPink
        return pageControl
    }
    
    fileprivate func setupBottomButton(title: String, titleColor: UIColor) -> UIButton {
        let button = UIButton(type: .system)
        button.setupButtonBackgroundColorTitleType(backgroundColor: .clear, title: title, type: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(titleColor, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        return button
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
}

extension SwipingController {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PageCell
        
        cell.page = pages[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}

extension SwipingController {
    @objc private func handleNextButtonTapped() {
        print("Trying to advance to next.")
        
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @objc private func handlePrevButtonTapped() {
        print("Trying to back to previous.")
        
        let previousIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: previousIndex, section: 0)
        pageControl.currentPage = previousIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}

