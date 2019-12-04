//
//  Day01.swift
//  
//
//  Created by Kip Landergren on 12/4/19.
//

import AdventOfCode2019Core
import Foundation

public struct Day01 {

  public static func part1(_ file: URL) -> Int {
    file
      .aoc_linesAsInts()
      .map { Day01.part1Single($0) }
      .reduce(0, +)
  }

  public static func part2(_ file: URL) -> Int {
    file
      .aoc_linesAsInts()
      .map { Day01.part2Single($0) }
      .reduce(0, +)
  }

}

// MARK: - helpers
extension Day01 {

  public static func part1Single(_ mass: Int) -> Int {
    AOCModule(mass).part1FuelNeeded()
  }

  public static func part2Single(_ mass: Int) -> Int {
    AOCModule(mass).part2FuelNeeded()
  }

}

