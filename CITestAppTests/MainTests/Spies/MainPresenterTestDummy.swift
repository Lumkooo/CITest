//
//  MainPresenterTestDummy.swift
//  CITestAppTests
//
//  Created by Андрей Шамин on 6/5/22.
//

import Foundation
@testable import CITestApp

final class MainPresenterTestDummy: MainPresenterInterface {

    private(set) var cars: [Car] = [
        Car(id: 0,
            model: .audi,
            year: 2000),
        Car(id: 1,
            model: .bmw,
            year: 2020),
        Car(id: 2,
            model: .lada,
            year: 2015),
    ]

    private(set) var isViewLoaded = false
    private(set) var isGettedCar = false
    private(set) var isGettedCarsCount = false
    private(set) var isCarAppended = false
    private(set) var isCarRemoved = false
    private(set) var isAllCarsRemoved = false

    func viewDidLoad(ui: MainViewInterface) {
        isViewLoaded = true
    }

    func getCar(at index: Int) -> Car? {
        isGettedCar = true
        return cars[safe: index]
    }

    func getCarsCount() -> Int {
        isGettedCarsCount = true
        return cars.count
    }

    func appendCar(_ car: Car) {
        isCarAppended = true
    }

    func removeCar(_ car: Car) {
        isCarRemoved = true
    }

    func removeAllCars() {
        isAllCarsRemoved = true
    }
}
