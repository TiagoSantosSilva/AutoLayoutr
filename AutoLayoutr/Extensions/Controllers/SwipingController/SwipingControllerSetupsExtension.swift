//
//  SwipingControllerSetupsExtension.swift
//  AutoLayoutr
//
//  Created by Tiago Santos on 13/01/18.
//  Copyright © 2018 Tiago Santos. All rights reserved.
//

import UIKit

extension SwipingController {
    internal func setupBottomControls() {
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
    
    internal func setupBottomPageControl() -> UIPageControl {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.numberOfPages = pages.count
        pageControl.currentPageIndicatorTintColor = .mainPink
        pageControl.pageIndicatorTintColor = .fadedPink
        return pageControl
    }
    
    internal func setupBottomButton(title: String, titleColor: UIColor) -> UIButton {
        let button = UIButton(type: .system)
        button.setupButtonBackgroundColorTitleType(backgroundColor: .clear, title: title, type: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(titleColor, for: .normal)
        return button
    }
}
