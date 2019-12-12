//
//  Day05.swift
//  
//
//  Created by Kip Landergren on 12/11/19.
//

import AdventOfCode2019Core
import Foundation

public struct Day05 {

  public static func bothParts(_ file: URL) {
    let initialProgram = file
      .aoc_commaInts()

    var computer = IntcodeComputer(initialProgram)
    let _ = computer.run()
  }

}
