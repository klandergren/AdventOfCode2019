//
//  IntcodeIO.swift
//  
//
//  Created by Kip Landergren on 12/14/19.
//

import Foundation

public protocol IntcodeIO {
  func output() -> Int?
  func read() -> Int?
  func write(_ data: Int)
}
