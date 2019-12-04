//
//  AOCModule.swift
//  
//
//  Created by Kip Landergren on 12/4/19.
//

import Foundation

public struct AOCModule {
  private let _mass: Int

  // MARK: init
  public init(_ mass: Int) {
    _mass = mass
  }
}

// MARK: - public API
extension AOCModule {

  public func part1FuelNeeded() -> Int {
    _fuelFor(_mass)
  }

  public func part2FuelNeeded() -> Int {
    _fuelHelper(_mass)
  }

}

// MARK: - helpers
extension AOCModule {

  private func _fuelHelper(_ initialMass: Int) -> Int {
    let additionalFuelNeeded = _fuelFor(initialMass)
    guard 0 < additionalFuelNeeded else {
      return 0
    }

    return additionalFuelNeeded + _fuelHelper(additionalFuelNeeded)
  }

  private func _fuelFor(_ initialMass: Int) -> Int {
    (initialMass / 3) - 2
  }

}
