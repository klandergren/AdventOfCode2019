//
//  Day02Tests.swift
//  
//
//  Created by Kip Landergren on 12/5/19.
//

import XCTest
import AdventOfCode2019Days
import class Foundation.Bundle

final class Day02Tests: XCTestCase {

  func testPart1() throws {
    [
      [[1,0,0,0,99], [2,0,0,0,99]],
      [[2,3,0,3,99], [2,3,0,6,99]],
      [[2,4,4,5,99,0], [2,4,4,5,99,9801]],
      [[1,1,1,4,99,5,6,0,99], [30,1,1,4,2,5,6,0,99]],
      ].forEach { (params) in
        let initialProgram = params[0]
        let finalProgram = params[1]

        XCTAssertEqual(Day02.part1Single(initialProgram), finalProgram)
    }
  }

}
