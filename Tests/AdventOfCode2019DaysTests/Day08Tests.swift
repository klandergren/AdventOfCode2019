//
//  Day08Tests.swift
//  
//
//  Created by Kip Landergren on 1/9/20.
//

import XCTest
import AdventOfCode2019Days
import class Foundation.Bundle

final class Day08Tests: XCTestCase {

  func testChecksum() throws {
    Day08.justPrint(3, 2, [1,2,3,4,5,6,7,8,9,0,1,2])
    [
      [3, 2, [1,2,3,4,5,6,7,8,9,0,1,2], 1],
      ].forEach { (params) in
        let width = params[0] as! Int
        let height = params[1] as! Int
        let data = params[2] as! [Int]

        let actualCheckSum = params[3] as! Int

        let testCheckSum = Day08.checksum(width, height, data)

        XCTAssertEqual(testCheckSum, actualCheckSum)
    }
  }

}
