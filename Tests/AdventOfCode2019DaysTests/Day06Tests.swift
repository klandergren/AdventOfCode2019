//
//  File.swift
//  
//
//  Created by Kip Landergren on 12/12/19.
//

import XCTest
import AdventOfCode2019Days
import class Foundation.Bundle

final class Day06Tests: XCTestCase {

  func testPart1Orbits() throws {
    let notedOrbits = [
      "COM)B",
      "B)C",
      "C)D",
      "D)E",
      "E)F",
      "B)G",
      "G)H",
      "D)I",
      "E)J",
      "J)K",
      "K)L",
    ]

    [
      ["D", 3],
      ["L", 7],
      ["COM", 0],
      ].forEach { (params) in
        let name = params[0] as! String
        let realNumOrbits = params[1] as! Int
        let testNumOrbits = Day06.part1TotalOrbitsOf(name, notedOrbits)

        XCTAssertEqual(testNumOrbits, realNumOrbits)
    }
  }

  func testPart1Checksum() throws {
    let notedOrbits = [
      "COM)B",
      "B)C",
      "C)D",
      "D)E",
      "E)F",
      "B)G",
      "G)H",
      "D)I",
      "E)J",
      "J)K",
      "K)L",
    ]
    let checksum = Day06.part1OrbitalCountChecksum(notedOrbits)
    XCTAssertEqual(checksum, 42)
  }

  func testPart2Tranfsers() throws {
    let notedOrbits = [
      "COM)B",
      "B)C",
      "C)D",
      "D)E",
      "E)F",
      "B)G",
      "G)H",
      "D)I",
      "E)J",
      "J)K",
      "K)L",
      "K)YOU",
      "I)SAN",
    ]

    let transfers = Day06.part2Transfers("YOU", "SAN", notedOrbits)
    XCTAssertEqual(transfers, 4)
  }

}
