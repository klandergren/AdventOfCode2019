//
//  Day06.swift
//  
//
//  Created by Kip Landergren on 12/12/19.
//

import AdventOfCode2019Core
import Foundation

public struct Day06 {

  public static func part1(_ file: URL) -> Int {
    part1OrbitalCountChecksum(file.aoc_linesAsStrings())
  }

  public static func part2(_ file: URL) -> Int {
    part2Transfers("YOU", "SAN", file.aoc_linesAsStrings())
  }

}

extension Day06 {

  public static func part1OrbitalCountChecksum(_ notedOrbits: [String]) -> Int {
    let orbitalMap = OrbitalMap(notedOrbits)
    return orbitalMap.orbitCountChecksum()
  }

  // testing
  public static func part1TotalOrbitsOf(_ name: String, _ notedOrbits: [String]) -> Int {
    let orbitalMap = OrbitalMap(notedOrbits)
    return orbitalMap.totalOrbitsOf(name)
  }

  // testing
  public static func part2Transfers(_ objectAName: String, _ objectBName: String, _ notedOrbits: [String]) -> Int {
    let orbitalMap = OrbitalMap(notedOrbits)
    return orbitalMap.transfersBetween(objectAName, objectBName)
  }

}
