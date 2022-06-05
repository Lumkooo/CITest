//
//  MainRouter.swift
//  CustomElementsApp
//
//  Created by Андрей Шамин on 5/21/22.
//

import UIKit

protocol MainRouterInterface: AnyObject {
    
}

class MainRouter: NSObject {
    weak var viewController: UIViewController?

    private func pushViewController(viewController: UIViewController?, animated: Bool = true) {
        guard let navigationController = self.viewController?.navigationController,
              let viewController = viewController else {
            return
        }
        navigationController.pushViewController(viewController, animated: animated)
    }
}

//MARK: - MainRouterInterface

extension MainRouter: MainRouterInterface {
    
}
