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
    "day02-part1",
    "day02-part2",
    "day03-part1",
    "day03-part2",
    "day04-part1",
    "day04-part2",
    "day05-part1",
    "day05-part2",
  ]

  private let _puzzle: String
  private let _inputData: URL
  private let _additionalArgs: [String]

  public init(arguments: [String] = CommandLine.arguments) {

    guard 3 <= arguments.count else {
      var message = "wrong number of arguments. usage:\n\n$ AdventOfCode2019 [puzzle-name] relative/path/to/input.txt [addition-arg1] [additional-arg2] ...\n\n"
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

    // pass any remaining args to the day method
    _additionalArgs = Array(passedArgs)
  }

  public func run() {
    switch _puzzle {
    case "day01-part1":
      print("\(Day01.part1(_inputData))")
    case "day01-part2":
      print("\(Day01.part2(_inputData))")
    case "day02-part1":
      guard _additionalArgs.count == 2 else {
        var message = "\n\nday02-part1 requires additional args [noun] and [verb] for restoring program input before running. Example:\n\n"
        message += "$ AdventOfCode2019 day02-part1 relative/path/to/input.txt [noun] [verb]\n\n"
        fatalError(message)
      }
      print("\(Day02.part1(_inputData, _additionalArgs))")
    case "day02-part2":
      guard _additionalArgs.count == 1 else {
        var message = "\n\nday02-part2 requires additional arg [desired-output]. Example:\n\n"
        message += "$ AdventOfCode2019 day02-part2 relative/path/to/input.txt [desired-output]\n\n"
        fatalError(message)
      }
      print("\(Day02.part2(_inputData, _additionalArgs))")
    case "day03-part1":
      guard _additionalArgs.count == 0 else {
        fatalError("\n\nday03-part1 requires no additional args\n\n")
      }
      print("\(Day03.part1(_inputData))")
    case "day03-part2":
      guard _additionalArgs.count == 0 else {
        fatalError("\n\nday03-part2 requires no additional args\n\n")
      }
      print("\(Day03.part2(_inputData))")
    case "day04-part1":
      guard _additionalArgs.count == 0 else {
        fatalError("\n\nday04-part1 requires no additional args\n\n")
      }
      print("\(Day04.part1(_inputData))")
    case "day04-part2":
      guard _additionalArgs.count == 0 else {
        fatalError("\n\nday04-part2 requires no additional args\n\n")
      }
      print("\(Day04.part2(_inputData))")
    case "day05-part1":
      guard _additionalArgs.count == 0 else {
        fatalError("\n\nday04-part2 requires no additional args\n\n")
      }
      Day05.bothParts(_inputData)
    case "day05-part2":
      guard _additionalArgs.count == 0 else {
        fatalError("\n\nday04-part2 requires no additional args\n\n")
      }
      Day05.bothParts(_inputData)
    default:
      fatalError("not implemented")
    }
  }

}
