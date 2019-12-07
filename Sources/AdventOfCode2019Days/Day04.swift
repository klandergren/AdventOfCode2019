//
//  Day04.swift
//  
//
//  Created by Kip Landergren on 12/6/19.
//

import AdventOfCode2019Core
import Foundation

public struct Day04 {

  public static func part1(_ file: URL) -> Int {
    let bounds = file
      .aoc_linesAsStrings()
      .first!
      .split(separator: "-")
      .map { Int($0)! }

    let lowerBound = bounds[0]
    let upperBound = bounds[1]

    return Password.part1_possiblePasswords(lowerBound, upperBound)
      .count
  }

  public static func part2(_ file: URL) -> Int {
    let bounds = file
      .aoc_linesAsStrings()
      .first!
      .split(separator: "-")
      .map { Int($0)! }

    let lowerBound = bounds[0]
    let upperBound = bounds[1]

    return Password.part2_possiblePasswords(lowerBound, upperBound)
      .count
  }

}

extension Day04 {

  public static func part1IsValid(_ password: Int) -> Bool {
    Password.part1_isValid(password)
  }

  public static func part2IsValid(_ password: Int) -> Bool {
    Password.part2_isValid(password)
  }

}
