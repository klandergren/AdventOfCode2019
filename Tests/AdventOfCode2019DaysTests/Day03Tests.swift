//
//  Day03Tests.swift
//  
//
//  Created by Kip Landergren on 12/6/19.
//

import XCTest
import AdventOfCode2019Days
import class Foundation.Bundle

final class Day03Tests: XCTestCase {

  func testPaths() throws {
    XCTAssertEqual(Day03.part1Coordinates("R1"), [[0,0], [1,0]])
    XCTAssertEqual(Day03.part1Coordinates("R1,R1"), [[0,0], [1,0], [2,0]])
    XCTAssertEqual(Day03.part1Coordinates("R3"), [[0,0], [1,0], [2,0], [3,0]])
    XCTAssertEqual(Day03.part1Coordinates("R3,U3"), [[0,0], [1,0], [2,0], [3,0], [3,1], [3,2], [3,3]])
    XCTAssertEqual(Day03.part1Coordinates("R3,U3,L1,D1"), [[0,0], [1,0], [2,0], [3,0], [3,1], [3,2], [3,3], [2,3], [2,2]])
  }

  func testIntersections() throws {
    var intersections = Set<[Int]>()
    intersections.insert([0,0])
    intersections.insert([1,0])
    XCTAssertEqual(Day03.part1Intersections(["R1", "R1,R1"]), intersections)
  }

  func testClosestDistances() throws {
    let testCases = [
      [
        [
          "R8,U5,L5,D3",
          "U7,R6,D4,L4",
        ],
        6,
      ],
      [
        [
          "R75,D30,R83,U83,L12,D49,R71,U7,L72",
          "U62,R66,U55,R34,D71,R55,D58,R83",
        ],
        159,
      ],
      [
        [
          "R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51",
          "U98,R91,D20,R16,D67,R40,U7,R15,U6,R7",
        ],
        135,
      ],
    ]

    testCases.forEach { (params) in
      let paths = params[0] as! [String]
      let closestDistance = params[1] as! Int
      XCTAssertEqual(Day03.part1ClosestDistance(paths), closestDistance)
    }

  }

  func testMinimumSteps() throws {
    let testCases = [
      [
        [
          "R8,U5,L5,D3",
          "U7,R6,D4,L4",
        ],
        30,
      ],
      [
        [
          "R75,D30,R83,U83,L12,D49,R71,U7,L72",
          "U62,R66,U55,R34,D71,R55,D58,R83",
        ],
        610,
      ],
      [
        [
          "R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51",
          "U98,R91,D20,R16,D67,R40,U7,R15,U6,R7",
        ],
        410,
      ],
    ]

    testCases.forEach { (params) in
      let paths = params[0] as! [String]
      let minimumSteps = params[1] as! Int
      XCTAssertEqual(Day03.part2steps(paths), minimumSteps)

    }

  }

}
