//
//  MainView.swift
//  CustomElementsApp
//
//  Created by Андрей Шамин on 5/21/22.
//

import UIKit

protocol MainViewInterface: AnyObject {
    func reloadCarsCollection()
}

final class MainView: UIView {

    private let presenter: MainPresenterInterface

    init(presenter: MainPresenterInterface) {
        self.presenter = presenter
        super.init(frame: .zero)
        setupElements()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - MainViewInterface

extension MainView: MainViewInterface {
    func reloadCarsCollection() {
        // TODO: - reloadCarsCollection
    }
}

// MARK: - UISetup

private extension MainView {
    func setupElements() {
        backgroundColor = .white
    }
}
