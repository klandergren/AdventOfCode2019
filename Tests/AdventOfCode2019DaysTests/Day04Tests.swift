//
//  Day04Tests.swift
//  
//
//  Created by Kip Landergren on 12/6/19.
//

import XCTest
import AdventOfCode2019Days
import class Foundation.Bundle

final class Day04Tests: XCTestCase {

  func testPart1() throws {
    [
      [111111, true],
      [223450, false],
      [123789, false],
      ].forEach { (params) in
        let possiblePassword = params[0] as! Int
        let isValid = params[1] as! Bool

        XCTAssertEqual(Day04.part1IsValid(possiblePassword), isValid)
    }
  }

  func testPart2() throws {
    [
      [112233, true],
      [123444, false],
      [111122, true],
      [566689, false],
      ].forEach { (params) in
        let possiblePassword = params[0] as! Int
        let isValid = params[1] as! Bool

        XCTAssertEqual(Day04.part2IsValid(possiblePassword), isValid, "\(possiblePassword)")
    }
  }

}
