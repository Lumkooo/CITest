//
//  AppNavigationViewController.swift
//  CustomElementsApp
//
//  Created by Андрей Шамин on 5/21/22.
//

import UIKit

final class AppNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
}

private extension AppNavigationViewController {
    func setupNavigationBar() {
        navigationBar.backgroundColor = .white
    }
}
