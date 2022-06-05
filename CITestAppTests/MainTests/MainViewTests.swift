//
//  MainViewControllerTests.swift
//  CITestAppTests
//
//  Created by Андрей Шамин on 6/5/22.
//

import XCTest

import XCTest
@testable import CITestApp

class MainViewTests: XCTestCase {
    
    // MARK: - Properties

    private var sut: MainView!
    private var presenter: MainPresenterTestDummy!

    // MARK: - Methods

    override func setUp() {
        super.setUp()
        self.presenter = MainPresenterTestDummy()
        self.sut = MainView(presenter: presenter)
    }

    override func tearDown() {
        self.sut = nil
        self.presenter = nil

        super.tearDown()
    }

}
