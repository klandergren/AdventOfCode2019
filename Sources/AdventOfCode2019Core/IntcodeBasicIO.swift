//
//  IntcodeBasicIO.swift
//  
//
//  Created by Kip Landergren on 12/14/19.
//

import Foundation

public struct IntcodeBasicIO: IntcodeIO {

  public func output() -> Int? {
    nil
  }

  public func read() -> Int? {
    print("please enter input:")
    return Int(readLine()!)
  }

  public func write(_ data: Int) {
    print(data)
  }

}
