//
//  MainPresenterTest.swift
//  CITestAppTests
//
//  Created by Андрей Шамин on 6/5/22.
//

import XCTest
@testable import CITestApp

class MainPresenterTest: XCTestCase {
    
    // MARK: - Properties

    private var sut: MainPresenter!
    private var view: MainPresenterViewDummy!
    private var router: MainRouterTestDummy!

    // MARK: - Methods

    override func setUp() {
        super.setUp()
        self.view = MainPresenterViewDummy()
        self.router = MainRouterTestDummy()
        self.sut = MainPresenter(router: router)
    }

    override func tearDown() {
        self.sut = nil
        self.view = nil
        self.router = nil

        super.tearDown()
    }

    func testUISetup() throws {
        sut.viewDidLoad(ui: view)
        
        XCTAssertNotNil(sut!.ui, "Presenter's UI is nil!")
    }

    func testReloadCarsCollection() throws {
        sut.reloadCarsCollection()
        XCTAssertNotNil(view.isCarsCollectionsReloaded, "Collections isn't reloaded!")
    }

    func testRemoveCar() throws {
        let count = sut.getCarsCount()

        let car = sut.getCar(at: 0)!
        sut.removeCar(car)
        let afterRemovingCount = sut.getCarsCount()

        XCTAssertNotEqual(count, afterRemovingCount, "Not removed at first index")
        XCTAssertEqual(count, afterRemovingCount+1, "Removed more than one! car")
    }

    func testAppendCar() throws {
        let count = sut.getCarsCount()

        let car = Car.testCar
        sut.appendCar(car)
        let afterAppendingCount = sut.getCarsCount()

        XCTAssertNotEqual(count, afterAppendingCount, "Car ins't inserted")
        XCTAssertEqual(count, afterAppendingCount-1, "Inserted more than one car")
    }

    func testRemoveAllCars() throws {
        sut.removeAllCars()

        let allCarsRemovedCount = sut.getCarsCount()
        XCTAssertEqual(allCarsRemovedCount, 0, "Removed not all cars")
    }

    func testGetCar() throws {
        sut.removeAllCars()

        let car = Car.testCar
        sut.appendCar(car)
        let sameCar = sut.getCar(at: 0)!

        XCTAssertEqual(car, sameCar, "Get car - car's are not the same")
    }
}
