//
//  SecondViewController.swift
//  CITestApp
//
//  Created by Андрей Шамин on 6/5/22.
//

import UIKit

final class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
}

private extension SecondViewController {
    func setupNavigationBar() {
        navigationItem.title = "Second"
    }
}
