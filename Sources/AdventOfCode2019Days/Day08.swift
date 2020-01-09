//
//  Day08.swift
//  
//
//  Created by Kip Landergren on 1/9/20.
//

import AdventOfCode2019Core
import Foundation

public struct Day08 {

  public static func part1(_ file: URL, _ additionalArgs: [String]) -> Int {
    let data = Array(file.aoc_linesAsStrings().first!).map { Int(String($0))! }
    let width = Int(additionalArgs[0])!
    let height = Int(additionalArgs[1])!

    let image = AOCImage(width, height, data)
    return image.checkSum()
  }

  public static func part2(_ file: URL, _ additionalArgs: [String]) {
    let data = Array(file.aoc_linesAsStrings().first!).map { Int(String($0))! }
    let width = Int(additionalArgs[0])!
    let height = Int(additionalArgs[1])!

    let image = AOCImage(width, height, data)
    image.render()
  }

}

extension Day08 {

  // testing
  public static func checksum(_ width: Int, _ height: Int, _ data: [Int]) -> Int {
    let image = AOCImage(width, height, data)
    return image.checkSum()
  }

  public static func justPrint(_ width: Int, _ height: Int, _ data: [Int]) {
    let image = AOCImage(width, height, data)
    image.printLayers()
  }

}
