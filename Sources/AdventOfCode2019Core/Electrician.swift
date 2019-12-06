//
//  Electrician.swift
//  
//
//  Created by Kip Landergren on 12/6/19.
//

import Foundation

public struct Electrician {

  // assume closest to 0,0
  public static func closestDistance(_ wires: [Wire]) -> Int {
    var intersections = intersectingPoints(wires)
    intersections.remove([0,0])
    return Array(intersections)
      .map { _manhattanDistance([0,0], $0) }
      .min()!
  }

  public static func intersectingPoints(_ wires: [Wire]) -> Set<[Int]> {
    // instructions say that a wire crossing with itself does not count so
    // remove those by dumping into a Set
    var allCoordinates = wires
      .flatMap { Set($0.coordinatesFrom(0, 0)) }

    allCoordinates.sort {
      if $0[0] == $1[0] {
        return $0[1] < $1[1]
      }
      return $0[0] < $1[0]
    }

    var intersections = Set<[Int]>()

    var prevCoordinate = [0,0]
    for coordinate in allCoordinates {
      if coordinate == prevCoordinate {
        intersections.insert(coordinate)
      }
      prevCoordinate = coordinate
    }

    return intersections
  }

}

extension Electrician {

  private static func _manhattanDistance(_ coordinateA: [Int], _ coordinateB: [Int]) -> Int {
    let xA = coordinateA[0]
    let yA = coordinateA[1]

    let xB = coordinateB[0]
    let yB = coordinateB[1]

    return abs(xB - xA) + abs(yB - yA)
  }

}
