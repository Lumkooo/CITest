//
//  Car.swift
//  CITestApp
//
//  Created by Андрей Шамин on 6/5/22.
//

import Foundation

struct Car {
    let id: Int
    let model: Model
    let year: Int

    static let testCar = Car(id: 123,
                             model: .audi,
                             year: 2020)

}

// MARK: - Equatable

extension Car: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}

// MARK: - Model

extension Car {
    enum Model {
        case bmw, mercedes, lada, audi
    }
}

extension Car.Model {
    var description: String {
        switch self {
        case .bmw:
            return "BMW"
        case .audi:
            return "Audi"
        case .mercedes:
            return "Mercedes"
        case .lada:
            return "Lada"
        }
    }
}

