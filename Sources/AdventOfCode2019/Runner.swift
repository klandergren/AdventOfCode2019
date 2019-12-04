//
//  Runner.swift
//  
//
//  Created by Kip Landergren on 12/4/19.
//

import Foundation
import AdventOfCode2019Days

public struct Runner {

  private let _validPuzzles = [
    "day01-part1",
    "day01-part2",
  ]

  private let _puzzle: String
  private let _inputData: URL

  public init(arguments: [String] = CommandLine.arguments) {

    guard arguments.count == 3 else {
      var message = "wrong number of arguments. usage:\n\n$ AdventOfCode2019 [puzzle-name] relative/path/to/input.txt\n\n"
      message += "where [puzzle-name] must be one of the following: \n\n"
      _validPuzzles.forEach { message += "\($0)\n"}
      message += "\n"
      fatalError(message)
    }

    // remove first argument, which is the command name
    var passedArgs = arguments.dropFirst()

    // assume the puzzle is next
    _puzzle = passedArgs.popFirst()!
    guard _validPuzzles.contains(_puzzle) else {
      var message = "Unknown puzzle: \(_puzzle)\n"
      message += "Must be one of the following: \n"
      _validPuzzles.forEach { message += "\($0)\n"}
      fatalError(message)
    }

    // assume a specially formmatted relative path is given next
    let currentDirectoryPath = FileManager.default.currentDirectoryPath
    let filePath = "\(currentDirectoryPath)/\(passedArgs.popFirst()!)"

    _inputData = URL(fileURLWithPath: filePath)
  }

  public func run() {
    switch _puzzle {
    case "day01-part1":
      print("\(Day01.part1(_inputData))")
    case "day01-part2":
      print("\(Day01.part2(_inputData))")
    default:
      fatalError("not implemented")
    }
  }

}
