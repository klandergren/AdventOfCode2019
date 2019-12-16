//
//  ThrusterController.swift
//  
//
//  Created by Kip Landergren on 12/14/19.
//

import Foundation

class AmplifierIO: IntcodeIO {

  private var _inputs: [Int]
  private var _writtenData: Int?

  init(_ initialInputs: [Int]) {
    _inputs = initialInputs
  }

  func output() -> Int? {
    _writtenData
  }

  func read() -> Int? {
    _inputs.removeFirst()
  }

  func write(_ data: Int) {
    _writtenData = data
  }

  func addInputs(_ newInputs: [Int]) {
    _inputs.append(contentsOf: newInputs)
  }

}

class Amplifier {
  private let _phaseSetting: Int

  private var _computer: IntcodeComputer
  private var _io: AmplifierIO

  init(_ phaseSetting: Int, _ initialProgram: [Int]) {
    _phaseSetting = phaseSetting
    _io = AmplifierIO([_phaseSetting])
    _computer = IntcodeComputer(initialProgram, _io)
  }

  func output(_ input: Int) -> Int? {
    _io.addInputs([input])
    _computer.run(pauseOnOutput: true)
    return _computer.output()
  }

  func isHalted() -> Bool {
    _computer.isHalted()
  }

}

public struct ThrusterController {

  private let _amplifiers: [Amplifier]
  private let _program: [Int]

  public init(_ phaseSettings: [Int], _ program: [Int]) {
    _amplifiers = phaseSettings.map { Amplifier($0, program) }
    _program = program
  }

  public func thrusterSignal() -> Int {
    var input = 0
    for amplifier in _amplifiers {
      input = amplifier.output(input)!
    }
    return input
  }

  public func thrusterSignalPart2() -> Int {
    var input = 0
    var shouldHalt = false

    while !shouldHalt {
      for amplifier in _amplifiers {
        input = amplifier.output(input)!
      }
      shouldHalt = _amplifiers.reduce(true, { $0 && $1.isHalted() })
    }

    return input
  }

}
