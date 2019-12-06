//
//  IntcodeComputer.swift
//  
//
//  Created by Kip Landergren on 12/5/19.
//

import Foundation

public struct IntcodeComputer {

  public static func run(_ initialProgram: [Int]) -> [Int] {
    // let's make a mutable copy so we have something to work with
    var program = initialProgram

    // step through the program by 4
    for opcodeIndex in stride(from: 0, to: initialProgram.count, by: 4) {
      let opcode = program[opcodeIndex]

      if opcode == 99 {
        // stop execution
        break
      }

      guard [1,2].contains(opcode) else {
        fatalError("unknown opcode: \(opcode)" )
      }

      let inputAIndex = opcodeIndex + 1
      let inputAPosition = program[inputAIndex]
      let inputAValue = program[inputAPosition]

      let inputBIndex = opcodeIndex + 2
      let inputBPosition = program[inputBIndex]
      let inputBValue = program[inputBPosition]

      let outputIndex = opcodeIndex + 3
      let outputPosition = program[outputIndex]

      if opcode == 1 {
        let result = inputAValue + inputBValue
        program[outputPosition] = result
        continue
      }

      if opcode == 2 {
        let result = inputAValue * inputBValue
        program[outputPosition] = result
        continue
      }

      fatalError("should never get here")
    }

    return program
  }

}
