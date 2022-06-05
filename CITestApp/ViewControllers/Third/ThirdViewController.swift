//
//  ThirdViewController.swift
//  CITestApp
//
//  Created by Андрей Шамин on 6/5/22.
//

import UIKit

final class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
}

private extension ThirdViewController {
    func setupNavigationBar() {
        navigationItem.title = "Third"
    }
}
