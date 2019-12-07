//
//  Password.swift
//  
//
//  Created by Kip Landergren on 12/6/19.
//

import Foundation

public struct Password {

  public static func part1_possiblePasswords(_ lowerBound: Int, _ upperBound: Int) -> [Int] {
    (lowerBound...upperBound)
      .filter { part1_isValid($0) }
  }

  public static func part1_isValid(_ password: Int) -> Bool {
    let asDigits = _numberAsDigits(password)

    return _ascending(asDigits) && _part1_hasDoubles(asDigits)
  }

  public static func part2_possiblePasswords(_ lowerBound: Int, _ upperBound: Int) -> [Int] {
    (lowerBound...upperBound)
      .filter { part2_isValid($0) }
  }

  public static func part2_isValid(_ password: Int) -> Bool {
    let asDigits = _numberAsDigits(password)

    return _ascending(asDigits) && _part2_hasDoubles(asDigits)
  }

}

extension Password {

  private static func _numberAsDigits(_ sixDigitNum: Int) -> [Int] {
    let asString = String(sixDigitNum)
    let asChars = Array(asString)
    let asArrayOfStrings = asChars.map { String($0) }
    let asInts = asArrayOfStrings.map { Int($0)! }

    return asInts
  }

  private static func _ascending(_ digits: [Int]) -> Bool {
    digits[0] <= digits[1]
      && digits[1] <= digits[2]
      && digits[2] <= digits[3]
      && digits[3] <= digits[4]
      && digits[4] <= digits[5]
  }

  private static func _part1_hasDoubles(_ digits: [Int]) -> Bool {
    (digits[0] == digits[1])
      || (digits[1] == digits[2])
      || (digits[2] == digits[3])
      || (digits[3] == digits[4])
      || (digits[4] == digits[5])
  }

  private static func _part2_hasDoubles(_ digits: [Int]) -> Bool {
    ((digits[0] == digits[1]) && (digits[1] != digits[2])) ||
      ((digits[1] == digits[2]) && (digits[1] != digits[0]) && (digits[2] != digits[3])) ||
      ((digits[2] == digits[3]) && (digits[2] != digits[1]) && (digits[3] != digits[4])) ||
      ((digits[3] == digits[4]) && (digits[3] != digits[2]) && (digits[4] != digits[5])) ||
      ((digits[4] == digits[5]) && (digits[4] != digits[3]))
  }

  private static func _backToNumber(_ digits: [Int]) -> Int {
    let asString = digits
      .map { String($0) }
      .reduce("", +)
    return Int(asString)!
  }
}
