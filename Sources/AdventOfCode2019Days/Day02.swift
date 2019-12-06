//
//  Day02.swift
//  
//
//  Created by Kip Landergren on 12/5/19.
//

import AdventOfCode2019Core
import Foundation

public struct Day02 {

  public static func part1(_ file: URL, _ additionalArgs: [String]) -> Int {
    let initialProgram = file.aoc_commaInts()
    let noun = Int(additionalArgs[0])!
    let verb = Int(additionalArgs[1])!

    let finalProgram = _restoreAndRun(initialProgram, noun, verb)

    return finalProgram[0]
  }

  public static func part2(_ file: URL, _ additionalArgs: [String]) -> Int {
    let initialProgram = file.aoc_commaInts()
    let desiredOutput = Int(additionalArgs[0])!

    for noun in (0...99) {
      for verb in (0...99) {
        let finalProgram = _restoreAndRun(initialProgram, noun, verb)
        if desiredOutput == finalProgram[0] {
          return 100 * noun + verb
        }
      }
    }
    fatalError("should have found a result!")
  }

}

extension Day02 {

  public static func part1Single(_ program: [Int]) -> [Int] {
    IntcodeComputer.run(program)
  }

}

extension Day02 {

  private static func _restoreAndRun(_ initialProgram: [Int], _ noun: Int, _ verb: Int) -> [Int] {
    let restoredProgram = _restore(initialProgram, noun, verb)
    let finalProgram = IntcodeComputer.run(restoredProgram)

    return finalProgram
  }

  private static func _restore(_ initialProgram: [Int], _ noun: Int, _ verb: Int) -> [Int] {
    var program = initialProgram

    program[1] = noun
    program[2] = verb

    return program
  }

}
