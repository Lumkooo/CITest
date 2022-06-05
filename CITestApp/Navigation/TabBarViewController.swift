//
//  TabBarViewController.swift
//  FitnesGPSDating
//
//  Created by Mr.Grig on 04.10.2018.
//  Copyright © 2018 DLabCompany. All rights reserved.
//

import UIKit

final class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    private var wasInit = false

    let rectShape = CAShapeLayer()
    let indicatorHeight: CGFloat = 5
    var indicatorWidth: CGFloat = 24
    let indicatorLeftMargin: CGFloat = 2

    private let fillColor = UIColor.red
    private let backgroundColor = UIColor.white

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        delegate = self
        
        let unselectedColor = fillColor.withAlphaComponent(0.5)

        let appearance = tabBar.standardAppearance
        appearance.backgroundColor = backgroundColor
        appearance.backgroundEffect = nil

        let selectedTextColor = [NSAttributedString.Key.foregroundColor: fillColor]
        let unselectedTextColor = [NSAttributedString.Key.foregroundColor: unselectedColor]


        appearance.stackedLayoutAppearance.normal.iconColor = unselectedColor
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = unselectedTextColor

        appearance.stackedLayoutAppearance.selected.iconColor = fillColor
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = selectedTextColor

        appearance.inlineLayoutAppearance.normal.iconColor = unselectedColor
        appearance.inlineLayoutAppearance.normal.titleTextAttributes = unselectedTextColor

        appearance.inlineLayoutAppearance.selected.iconColor = fillColor
        appearance.inlineLayoutAppearance.selected.titleTextAttributes = selectedTextColor

        self.tabBar.standardAppearance = appearance

        tabBar.backgroundColor = backgroundColor
        setupTabBarIndicator()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard !wasInit else {
            return
        }
        wasInit = true
        
        let imageNames = [
            "message",
            "cloud",
            "person"
        ]
        
        let count = min(imageNames.count, (self.tabBar.items?.count ?? 0))
        for index in 0 ..< count {
            let selectedIconSuffix = ".fill"
            
            let item = tabBar.items?[index]
            item?.title = nil
            
            let iconName = imageNames[index]
            item?.image = UIImage(systemName: iconName)
            
            let selectedIconName = imageNames[index] + selectedIconSuffix
            let selectedImage = UIImage(systemName: selectedIconName)
            item?.selectedImage = selectedImage
        }
        
        setupLineView()
    }
    
    func tabBarController(_ tabBarController: UITabBarController,
                          shouldSelect viewController: UIViewController) -> Bool{
        if let index = tabBarController.viewControllers?.firstIndex(of: viewController) {
            updateTabbarIndicatorBySelectedTabIndex(index: index)
        }
        return true
    }
}

private extension TabBarViewController {
    func setupLineView() {
        let height: CGFloat = 1

        let lineView = UIView()
        
        lineView.backgroundColor = UIColor.lightGray

        tabBar.addSubview(lineView)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            lineView.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor),
            lineView.topAnchor.constraint(equalTo: tabBar.topAnchor),
            lineView.heightAnchor.constraint(equalToConstant: height)
        ])
    }
    
    func setupTabBarIndicator() {
        // setup tabbar indicator
        rectShape.fillColor = fillColor.cgColor
        tabBar.layer.addSublayer(rectShape)
        delegate = self

        // initial position
        updateTabbarIndicatorBySelectedTabIndex(index: 0)
    }
    
    func updateTabbarIndicatorBySelectedTabIndex(index: Int) -> Void {
        let yValue = self.tabBar.bounds.minY
        
        let tabBarItemWidth = tabBar.frame.width / 3
        
        let lineWidth = indicatorWidth - indicatorLeftMargin
        let updatedBounds = CGRect(
            x: CGFloat(index) * tabBarItemWidth + (tabBarItemWidth/2 - lineWidth/2),
            y: yValue,
            width: indicatorWidth - indicatorLeftMargin,
            height: indicatorHeight)
        
        let path = CGMutablePath()
        path.addRoundedRect(in: updatedBounds, cornerWidth: 2, cornerHeight: indicatorHeight/2)
        
        let animation = CABasicAnimation(keyPath: "path")
        animation.fromValue = rectShape.path
        animation.toValue = path
        animation.duration = 0.3
        animation.repeatCount = 0
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        animation.isCumulative = true
        animation.timingFunction = CAMediaTimingFunction.init(name: .easeOut)
        
        rectShape.add(animation, forKey: "path")
        rectShape.path = path
    }
}
