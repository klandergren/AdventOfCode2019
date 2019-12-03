
import Foundation

// day 1
struct AOCModule {
  let mass: Int

  func part1FuelNeeded() -> Int {
    _fuelFor(mass)
  }

  func part2FuelNeeded() -> Int {
    _fuelHelper(mass)
  }

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

// part 1 tests
[
  [12, 2],
  [14, 2],
  [1969, 654],
  [100756, 33583],
  ].forEach { (params) in
    let actualMass = params[0]
    let actualFuel = params[1]
    let mod = AOCModule(mass: actualMass)
    guard mod.part1FuelNeeded() == actualFuel else {
      fatalError("Expected \(actualFuel) but got: \(mod.part1FuelNeeded())")
    }
}

// real data
let day01Content = try! String(contentsOfFile: "day-01-part-01-input.txt")
let day01Modules = day01Content.split(separator: "\n")
  .map { AOCModule(mass: Int(String($0))!) }

let day01Part01Total = day01Modules
  .map { $0.part1FuelNeeded() }
  .reduce(0, +)

print("day 01 part 1: \(day01Part01Total)")

// part 2 tests
[
  [14, 2],
  [1969, 966],
  [100756, 50346],
  ].forEach { (params) in
    let actualMass = params[0]
    let actualFuel = params[1]
    let mod = AOCModule(mass: actualMass)
    guard mod.part2FuelNeeded() == actualFuel else {
      fatalError("Expected \(actualFuel) but got: \(mod.part2FuelNeeded())")
    }
}

let day01Part02Total = day01Modules
  .map { $0.part2FuelNeeded() }
  .reduce(0, +)

print("day 01 part 2: \(day01Part02Total)")
