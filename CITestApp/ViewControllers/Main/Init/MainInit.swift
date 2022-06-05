//
//  MainInit.swift
//  CustomElementsApp
//
//  Created by Андрей Шамин on 5/21/22.
//

import UIKit

final class MainInit {
    static func createViewController() -> MainViewController {
        let router = MainRouter()
        let presenter = MainPresenter(router: router)
        let viewController = MainViewController(presenter: presenter)

        router.viewController = viewController

        return viewController
    }
}

