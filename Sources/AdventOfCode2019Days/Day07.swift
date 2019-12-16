//
//  Day07.swift
//  
//
//  Created by Kip Landergren on 12/14/19.
//

import AdventOfCode2019Core
import Foundation

public struct Day07 {

  public static func part1(_ file: URL) -> Int {
    let program = file.aoc_commaInts()

    var max = -1

    for a in (0..<5) {
      for b in (0..<5) {
        guard b != a else {
          continue
        }
        for c in (0..<5) {
          guard (c != b) && (c != a) else {
            continue
          }
          for d in (0..<5) {
            guard (d != c) && (d != b) && (d != a) else {
              continue
            }
            for e in (0..<5) {
              guard (e != d) && (e != c) && (e != b) && (e != a) else {
                continue
              }
              print("testing: \([a,b,c,d,e])")
              let possibleMax = part1ThrusterSignal([a,b,c,d,e], program)
              if max < possibleMax {
                max = possibleMax
              }
            }
          }
        }
      }
    }
    return max
  }

  public static func part2(_ file: URL) -> Int {
    let program = file.aoc_commaInts()

    var max = -1

    for a in (5..<10) {
      for b in (5..<10) {
        guard b != a else {
          continue
        }
        for c in (5..<10) {
          guard (c != b) && (c != a) else {
            continue
          }
          for d in (5..<10) {
            guard (d != c) && (d != b) && (d != a) else {
              continue
            }
            for e in (5..<10) {
              guard (e != d) && (e != c) && (e != b) && (e != a) else {
                continue
              }
              print("testing: \([a,b,c,d,e])")
              let possibleMax = part2ThrusterSignal([a,b,c,d,e], program)
              if max < possibleMax {
                max = possibleMax
              }
            }
          }
        }
      }
    }
    return max
  }

}

extension Day07 {

  // testing
  public static func part1ThrusterSignal(_ phaseSettings: [Int], _ program: [Int]) -> Int {
    let thrusterController = ThrusterController(phaseSettings, program)
    return thrusterController.thrusterSignal()
  }

  // testing
  public static func part2ThrusterSignal(_ phaseSettings: [Int], _ program: [Int]) -> Int {
    let thrusterController = ThrusterController(phaseSettings, program)
    return thrusterController.thrusterSignalPart2()
  }

}
