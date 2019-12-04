//
//  URL+helpers.swift
//  
//
//  Created by Kip Landergren on 12/4/19.
//

import Foundation

extension URL {

  public func aoc_linesAsInts() -> [Int] {
    aoc_linesAsStrings()
      .map { Int($0)! }
  }

  public func aoc_linesAsStrings() -> [String] {
    aoc_asText()
      .split(separator: "\n")
      .map { String($0) }
  }

  public func aoc_asText() -> String {
    var text = ""
    do {
      text = try String(contentsOf: self)
    } catch {
      fatalError(error.localizedDescription)
    }

    return text
  }

}
