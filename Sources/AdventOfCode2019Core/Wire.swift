//
//  Wire.swift
//  
//
//  Created by Kip Landergren on 12/6/19.
//

import Foundation

public struct Wire {
  private let _path: String

  public init(_ path: String) {
    _path = path
  }

  public func stepsTo(_ coordinate: [Int]) -> Int {
    coordinatesFrom(0, 0).firstIndex(of: coordinate)!
  }

  public func coordinatesFrom(_ centralPortX: Int, _ centralPortY: Int) -> [[Int]] {
    var coordinates = [[Int]]()

    var x = centralPortX
    var y = centralPortY

    // add central port
    coordinates.append([x, y])

    // assume only positive input. e.g. "R0" or "R-23" are invalid
    for stepInput in _path.split(separator: ",") {
      var step = stepInput
      let stepDirection = step.remove(at: step.startIndex)
      let stepCount = Int(step)!

      for _ in 1...stepCount {
        switch stepDirection {
        case "R":
            x += 1
        case "U":
            y += 1
        case "L":
            x -= 1
        case "D":
            y -= 1
        default:
          fatalError("unknown stepDirection: \(stepDirection)")
        }

        let coordinate = [x, y]
        coordinates.append(coordinate)
      }
    }

    return coordinates
  }

}
