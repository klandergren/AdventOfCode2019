//
//  Image.swift
//  
//
//  Created by Kip Landergren on 1/9/20.
//

import Foundation

struct Layer {
  private let _rows: [[Int]]
  init(_ rows: [[Int]]) {
    _rows = rows
  }

  func rows() -> [[Int]] {
    _rows
  }

  func checksum() -> Int {
    numberOf(1) * numberOf(2)
  }

  func numberOf(_ number: Int) -> Int {
    _rows.flatMap { $0 }
      .filter { $0 == number }
      .count
  }
}

public struct AOCImage {
  private let _width: Int
  private let _height: Int

  private let _layers: [Layer]

  public init(_ width: Int, _ height: Int, _ data: [Int]) {
    _width = width
    _height = height

    var widthCounter = 0
    var heightCounter = 0

    var layers = [Layer]()

    var rows = [[Int]]()
    var row = [Int]()

    for pixelData in data {
      row.append(pixelData)
      widthCounter += 1

      if widthCounter < width {
        // do nothing
      } else {
        // we have new row
        rows.append(row)
        row = [Int]()
        widthCounter = 0
        heightCounter += 1

        // and potentially new layer!
        if heightCounter < height {
          // do nothing
        } else {
          let layer = Layer(rows)
          layers.append(layer)
          rows = [[Int]]()
          heightCounter = 0
        }
      }

    }

    _layers = layers
  }

  public func checkSum() -> Int {
    _layers.min { (a, b) -> Bool in
      a.numberOf(0) < b.numberOf(0)
      }!.checksum()
  }

  public func render() {
    for y in 0..<_height {
      var row = ""
      for x in 0..<_width {
        row.append("\(_color(x, y))")
      }
      print(row)
    }
  }

  public func printLayers() {
    var i = 0
    for layer in _layers {
      print("Layer: \(i)\n")
      for row in layer.rows() {
        var cols = ""
        for col in row {
          cols.append("\(col)")
        }
        print("\(cols)")
      }
      i += 1
    }
  }

  private func _color(_ x: Int, _ y: Int) -> String {
    let pixels = _layers.map { $0.rows()[y][x] }

    for pixel in pixels {
      if pixel == 1 {
        return "|"
      }
      if pixel == 0 {
        return " "
      }
    }

    return "?"
  }

}
