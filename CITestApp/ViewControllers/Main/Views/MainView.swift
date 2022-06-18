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
        super.init(coder: coder)
    }
}

// MARK: - MainViewInterface

extension MainView: MainViewInterface {
    func reloadCarsCollection() {
        print("RELOAD CARS COLLECTIONS!")
        // TODO: - reloadCarsCollection
    }
}

// MARK: - UISetup

private extension MainView {
    func setupElements() {
        backgroundColor = .white
    }
}
