//
//  Day03.swift
//  
//
//  Created by Kip Landergren on 12/6/19.
//

import AdventOfCode2019Core
import Foundation

public struct Day03 {

  public static func part1(_ file: URL) -> Int {
    let wires = file
      .aoc_linesAsStrings()
      .map { Wire($0) }

    return Electrician.closestDistance(wires)
  }

  public static func part2(_ file: URL) -> Int {
    let paths = file
      .aoc_linesAsStrings()

    return part2steps(paths)
  }

}

// MARK: - helpers
extension Day03 {

  public static func part1Coordinates(_ path: String) -> [[Int]] {
    let wire = Wire(path)
    return wire.coordinatesFrom(0, 0)
  }

  public static func part1Intersections(_ paths: [String]) -> Set<[Int]> {
    var wires = [Wire]()
    for path in paths {
      wires.append(Wire(path))
    }
    return Electrician.intersectingPoints(wires)
  }

  public static func part1ClosestDistance(_ paths: [String]) -> Int {
    var wires = [Wire]()
    for path in paths {
      wires.append(Wire(path))
    }
    return Electrician.closestDistance(wires)
  }

  public static func part2steps(_ paths: [String]) -> Int {
    let wires = paths.map { Wire($0) }

    var minimumSteps = [Int]()
    // for each intersection, calculate its score
    for intersection in Electrician.intersectingPoints(wires) {
      if intersection == [0,0] {
        continue
      }
      let minimumTotalSteps = wires
        .map { $0.stepsTo(intersection) }
        .reduce(0, +)
      minimumSteps.append(minimumTotalSteps)
    }

    return minimumSteps.min()!
  }

}
