//
//  IntcodeComputer.swift
//  
//
//  Created by Kip Landergren on 12/5/19.
//

import Foundation

public struct IntcodeComputer {

  private let _initialProgram: [Int]
  private let _io: IntcodeIO

  private var _memory: [Int]
  private var _instructionPointer: Int
  private var _isHalted = false

  public init(_ initialProgram: [Int]) {
    self.init(initialProgram, IntcodeBasicIO())
  }

  public init(_ initialProgram: [Int], _ io: IntcodeIO) {
    _initialProgram = initialProgram
    _memory = initialProgram
    _instructionPointer = 0
    _io = io
  }

  public mutating func restore(address: Int, toValue value: Int) {
    guard _memory.indices.contains(address) else {
      fatalError("address out of range: \(address)")
    }
    _memory[address] = value
  }

  public mutating func reset() {
    _memory = _initialProgram
    _isHalted = false
  }

  public func output() -> Int? {
    _io.output()
  }

  public func memory() -> [Int] {
    _memory
  }

  public func isHalted() -> Bool {
    _isHalted
  }

  public mutating func run() -> [Int] {
    run(pauseOnOutput: false)
    return _memory
  }

  public mutating func run(pauseOnOutput: Bool) {
    while _instructionPointer < _memory.count {
      // read the first address
      let opcodeValue = _readMemoryAddress(_instructionPointer)

      // determine the instruction
      let instruction = IntcodeInstruction.byOpcode(opcodeValue)

      // halt if necessary
      if instruction.shouldHalt() {
        _isHalted = true
        print("halt!")
        break
      }

      // run the instruction, saving the result to memory
      instruction.run(&_instructionPointer, &_memory, _io)

      // check for output
      if instruction.hasOutput() && pauseOnOutput {
        break
      }
    }

  }

  private func _readMemoryBlock(_ address: Int, _ range: Int) -> [Int] {
    guard _memory.indices.contains(address) else {
      fatalError("address out of range: \(address)")
    }
    let start = address
    let end = address + range

    return Array(_memory[start...end])
  }

  private func _readMemoryAddress(_ address: Int) -> Int {
    guard _memory.indices.contains(address) else {
      fatalError("address out of range: \(address)")
    }

    return _memory[address]
  }

}
