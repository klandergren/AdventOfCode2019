//
//  Day01Tests.swift
//  
//
//  Created by Kip Landergren on 12/4/19.
//

import XCTest
import AdventOfCode2019Days
import class Foundation.Bundle

final class Day01Tests: XCTestCase {

  func testPart1() throws {
    [
      [12, 2],
      [14, 2],
      [1969, 654],
      [100756, 33583],
      ].forEach { (params) in
        let mass = params[0]
        let actualFuel = params[1]

        XCTAssertEqual(Day01.part1Single(mass), actualFuel)
    }
  }

  func testPart2() throws {
    [
      [14, 2],
      [1969, 966],
      [100756, 50346],
      ].forEach { (params) in
        let mass = params[0]
        let actualFuel = params[1]
        XCTAssertEqual(Day01.part2Single(mass), actualFuel)
    }
  }

}
