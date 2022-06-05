//
//  AppLaunchRouter.swift
//  CustomElementsApp
//
//  Created by Андрей Шамин on 5/21/22.
//

import Foundation
import UIKit

final class AppLaunchRouter {
    func getRootViewController() -> UIViewController {

        let tabBarViewController = TabBarViewController()

        let mainVC = MainInit.createViewController()
        let mainNavigationController = AppNavigationViewController(rootViewController: mainVC)

        let secondViewController = SecondViewController()
        let secondNavigationController = AppNavigationViewController(rootViewController: secondViewController)

        let thirdViewController = ThirdViewController()
        let thirdNavigationController = AppNavigationViewController(rootViewController: thirdViewController)

        tabBarViewController.viewControllers = [
            mainNavigationController,
            secondNavigationController,
            thirdNavigationController
        ]

        return tabBarViewController
    }
}

private extension AppLaunchRouter {

}
