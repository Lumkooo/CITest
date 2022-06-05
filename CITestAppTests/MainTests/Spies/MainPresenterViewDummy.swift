//
//  MainPresenterViewDummy.swift
//  CITestAppTests
//
//  Created by Андрей Шамин on 6/5/22.
//

import Foundation
@testable import CITestApp

final class MainPresenterViewDummy: MainViewInterface {

    private(set) var isCarsCollectionsReloaded = false

    func reloadCarsCollection() {
        isCarsCollectionsReloaded = true
    }
}
