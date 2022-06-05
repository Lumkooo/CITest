//
//  MainPresenter.swift
//  CustomElementsApp
//
//  Created by Андрей Шамин on 5/21/22.
//

import UIKit

protocol MainPresenterInterface: AnyObject {
    func viewDidLoad(ui: MainViewInterface)

    func getCar(at index: Int) -> Car?

    func getCarsCount() -> Int

    func appendCar(_ car: Car)

    func removeCar(_ car: Car)

    func removeAllCars()
}

final class MainPresenter {
    private var router: MainRouterInterface
    private(set) weak var ui: MainViewInterface?

    private var cars: [Car] = [
        Car(id: 13530,
            model: .audi,
            year: 2018),
        Car(id: 13531,
            model: .bmw,
            year: 2004),
        Car(id: 13532,
            model: .lada,
            year: 2020),
        Car(id: 13533,
            model: .mercedes,
            year: 2022)
    ]

    init(router: MainRouterInterface) {
        self.router = router
    }

    func reloadCarsCollection() {
        ui?.reloadCarsCollection()
    }
}

// MARK: - MainPresenterInterface

extension MainPresenter: MainPresenterInterface {
    func viewDidLoad(ui: MainViewInterface) {
        self.ui = ui
    }

    func getCar(at index: Int) -> Car? {
        return cars[safe: index]
    }

    func getCarsCount() -> Int {
        return cars.count
    }

    func appendCar(_ car: Car) {
        cars.append(car)
    }

    func removeCar(_ car: Car) {
        guard let firstIndex = cars.firstIndex(of: car) else {
            return
        }
        cars.remove(at: firstIndex)
    }

    func removeAllCars() {
        cars.removeAll()
    }
}
