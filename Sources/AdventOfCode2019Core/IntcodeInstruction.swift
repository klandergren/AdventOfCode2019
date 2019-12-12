//
//  IntcodeInstruction.swift
//  
//
//  Created by Kip Landergren on 12/6/19.
//

import Foundation

public struct IntcodeInstruction {

  private enum ParameterMode: Int {
    case Position, Immediate
  }

  private struct Parameter {
    let mode: ParameterMode
    let value: Int

    func getValue(_ memory: [Int]) -> Int {
      switch mode {
      case .Immediate:
        return value
      case .Position:
        return memory[value]
      }
    }

  }

  private let _rawOpcode: Int
  private let _cleanedOpcode: Int
  private let _numParams: Int
  private let _block: ([Parameter], inout Int, inout [Int]) -> Void

  private static let kValidOpcodes = [1,2,3,4,5,6,7,8,99]

  private init(_ opcode: Int, _ numParams: Int, block: @escaping ([Parameter], inout Int, inout [Int]) -> Void) {
    _rawOpcode = opcode
    _cleanedOpcode = IntcodeInstruction._extractCleanedOpcode(opcode)
    _numParams = numParams
    _block = block
  }

  // 1 for the opCode
  public func numValues() -> Int {
    1 + _numParams
  }

  public func run(_ instructionPointer: inout Int, _ memory: inout [Int]) {

    let paramValues = Array(memory[(instructionPointer + 1)..<(instructionPointer + numValues())])

    let paramModes = IntcodeInstruction._extractParamModes(_rawOpcode, _numParams)

    var params = [Parameter]()
    var i = 0
    for mode in paramModes {

      let value = paramValues[i]
      params.append(Parameter(mode: mode, value: value))
      i += 1
    }

    _block(params, &instructionPointer, &memory)
  }

  public func shouldHalt() -> Bool {
    return _rawOpcode == 99
  }

  public static func byOpcode(_ opcode: Int) -> IntcodeInstruction {
    let kl_opcode = _extractCleanedOpcode(opcode)

    switch kl_opcode {
    case 1:
      return IntcodeInstruction(opcode, 3) { (params, instructionPointer, memory) in
        print("processing: \(opcode), \(params.map { $0.value })")
        let paramA = params[0]
        let valueA = paramA.getValue(memory)

        let paramB = params[1]
        let valueB = paramB.getValue(memory)

        let paramC = params[2]
        guard paramC.mode == .Position else {
          fatalError("writing parameter in position mode? opcode: \(opcode)")
        }
        let valueC = paramC.value // hack for now

        memory[valueC] = valueA + valueB
        instructionPointer += (1 + params.count)
      }
    case 2:
      return IntcodeInstruction(opcode, 3) { (params, instructionPointer, memory) in
        print("processing: \(opcode), \(params.map { $0.value })")
        let paramA = params[0]
        let valueA = paramA.getValue(memory)

        let paramB = params[1]
        let valueB = paramB.getValue(memory)

        let paramC = params[2]
        guard paramC.mode == .Position else {
          fatalError("writing parameter in position mode? opcode: \(opcode)")
        }
        let valueC = paramC.value

        let result = valueA * valueB

        memory[valueC] = result
        instructionPointer += (1 + params.count)
      }
    case 3:
      return IntcodeInstruction(opcode, 1) { (params, instructionPointer, memory) in
        print("processing: \(opcode), \(params.map { $0.value })")
        let paramA = params[0]
        guard paramA.mode == .Position else {
          fatalError("why is writing parameter in Immediate mode? opcode: \(opcode)")
        }
        let valueA = paramA.value

        print("please enter input:")
        let result = Int(readLine()!)!

        memory[valueA] = result
        instructionPointer += (1 + params.count)
      }
    case 4:
      return IntcodeInstruction(opcode, 1) { (params, instructionPointer, memory) in
        print("processing: \(opcode), \(params.map { $0.value })")
        let paramA = params[0]
        let valueA = paramA.getValue(memory)

        print(valueA)
        instructionPointer += (1 + params.count)
      }
    case 5:
      return IntcodeInstruction(opcode, 2) { (params, instructionPointer, memory) in
        print("processing: \(opcode), \(params.map { $0.value })")
        let paramA = params[0]
        let valueA = paramA.getValue(memory)

        if valueA == 0 {
          instructionPointer += (1 + params.count)
        } else {
          let paramB = params[1]
          let valueB = paramB.getValue(memory)
          instructionPointer = valueB
        }
      }
    case 6:
      return IntcodeInstruction(opcode, 2) { (params, instructionPointer, memory) in
        print("processing: \(opcode), \(params.map { $0.value })")
        let paramA = params[0]
        let valueA = paramA.getValue(memory)

        if valueA == 0 {
          let paramB = params[1]
          let valueB = paramB.getValue(memory)
          instructionPointer = valueB
        } else {
          instructionPointer += (1 + params.count)
        }
      }
    case 7:
      return IntcodeInstruction(opcode, 3) { (params, instructionPointer, memory) in
        print("processing: \(opcode), \(params.map { $0.value })")
        let paramA = params[0]
        let valueA = paramA.getValue(memory)

        let paramB = params[1]
        let valueB = paramB.getValue(memory)

        let paramC = params[2]
        guard paramC.mode == .Position else {
          fatalError("writing parameter in position mode? opcode: \(opcode)")
        }
        let valueC = paramC.value

        if valueA < valueB {
          memory[valueC] = 1
        } else {
          memory[valueC] = 0
        }

        instructionPointer += (1 + params.count)
      }
    case 8:
      return IntcodeInstruction(opcode, 3) { (params, instructionPointer, memory) in
        print("processing: \(opcode), \(params.map { $0.value })")
        let paramA = params[0]
        let valueA = paramA.getValue(memory)

        let paramB = params[1]
        let valueB = paramB.getValue(memory)

        let paramC = params[2]
        guard paramC.mode == .Position else {
          fatalError("writing parameter in position mode? opcode: \(opcode)")
        }
        let valueC = paramC.value

        if valueA == valueB {
          memory[valueC] = 1
        } else {
          memory[valueC] = 0
        }

        instructionPointer += (1 + params.count)
      }
    case 99:
      return IntcodeInstruction(opcode, 0) { (params, instructionPointer, memory) in
        // do nothing
      }
    default:
      fatalError("Unknown opcode: \(opcode)")
    }
  }

}

// MARK: - helpers
extension IntcodeInstruction {

  // extract the two rightmost digits
  private static func _extractCleanedOpcode(_ opcode: Int) -> Int {
    guard 0 < opcode else {
      fatalError("unable to handle opcode: \(opcode)")
    }

    // less than two digits, so we are good
    if opcode < 100 {
      return opcode
    }

    // avert your eyes
    let opcodeStrings = Array(String(opcode).reversed())
      .map { String($0) }

    let onesPlace = Int(opcodeStrings[0])!
    let tensPlace = Int(opcodeStrings[1])!

    let cleanedOpcode = Int("\(tensPlace)\(onesPlace)")!

    guard kValidOpcodes.contains(where: { $0 == cleanedOpcode} ) else {
      fatalError("unable to handle opcode: \(opcode)\ncleaned: \(cleanedOpcode)")
    }

    return cleanedOpcode
  }

  private static func _extractParamModes(_ opcode: Int, _ numParams: Int) -> [ParameterMode] {
    guard 0 < opcode else {
      fatalError("unable to handle opcode: \(opcode)")
    }

    // assume leading 0s
    if opcode < 100 {
      var modes = [ParameterMode]()
      for _ in 0..<numParams {
        modes.append(.Position)
      }
      return modes
    }

    // we should have three or more digits now
    var modes = Array(String(opcode))
      .dropLast(2)
      .reversed()
      .map { String($0) }
      .map { Int($0)! }
      .map { ParameterMode(rawValue: $0)! }

    for i in 0..<numParams {
      if modes.indices.contains(i) {
        continue
      }
      // default to position mode
      modes.append(.Position)
    }

    return modes
  }

}
