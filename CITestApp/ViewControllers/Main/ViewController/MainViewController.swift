//
//  MainViewController.swift
//  CustomElementsApp
//
//  Created by Андрей Шамин on 5/21/22.
//

import UIKit

final class MainViewController: UIViewController {

    // MARK: - Properties

    private let ui: MainView
    private let presenter: MainPresenterInterface

    // MARK: - Init

    init(presenter: MainPresenterInterface) {
        self.presenter = presenter
        self.ui = MainView(presenter: presenter)
        super.init(nibName: nil,
                   bundle: nil)
        setupNavigationBar()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - ViewController life cycle

    override func loadView() {
        super.loadView()
        view = ui
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad(ui: self.ui)
    }
}

private extension MainViewController {
    func setupNavigationBar() {
        navigationItem.title = "First"
    }
}
