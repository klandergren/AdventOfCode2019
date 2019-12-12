//
//  OrbitalMap.swift
//  
//
//  Created by Kip Landergren on 12/12/19.
//

import Foundation

class OrbitalObject {
  let name: String

  var directlyOrbiting: OrbitalObject? = nil
  var directlyOrbitedBy = [OrbitalObject]()

  init(_ name: String) {
    self.name = name
  }

  func totalOrbits() -> Int {
    _indirectOrbits() + _directOrbits()
  }

  func anscestors() -> [OrbitalObject] {
    var ancestors = [OrbitalObject]()

    var parent = directlyOrbiting
    while parent != nil {
      ancestors.append(parent!)
      parent = parent!.directlyOrbiting
    }

    return ancestors
  }

}

extension OrbitalObject {

  private func _indirectOrbits() -> Int {
    var indirectCount = 0
    var parent = directlyOrbiting
    while parent != nil {
      indirectCount += parent!._directOrbits()
      parent = parent!.directlyOrbiting
    }
    return indirectCount
  }

  private func _directOrbits() -> Int {
    (directlyOrbiting == nil) ? 0 : 1
  }

}

public struct OrbitalMap {
  private var _orbitalObjects = [OrbitalObject]()

  // expects strings of form AAA)BBB
  public init(_ notedOrbits: [String]) {
    for notedOrbit in notedOrbits {
      let names = notedOrbit
        .split(separator: ")")
        .map { String($0) }

      let nameA = names[0]
      let nameB = names[1]

      let objectA = _objectBy(nameA) ?? OrbitalObject(nameA)
      let objectB = _objectBy(nameB) ?? OrbitalObject(nameB)

      objectA.directlyOrbitedBy.append(objectB)
      objectB.directlyOrbiting = objectA

      if !_orbitalObjects.contains(where: { $0.name == objectA.name}) {
        _orbitalObjects.append(objectA)
      }

      if !_orbitalObjects.contains(where: { $0.name == objectB.name}) {
        _orbitalObjects.append(objectB)
      }
    }
  }

  public func transfersBetween(_ objectAName: String, _ objectBName: String) -> Int {
    let objectA = _objectBy(objectAName)!
    let objectB = _objectBy(objectBName)!

    let objectAAncestors = objectA.anscestors()
    let objectBAncestors = objectB.anscestors()

    // find first shared ancestor
    var sharedAncestor: OrbitalObject?
    for ancestor in objectAAncestors {
      if let foundAncestor = objectBAncestors.first(where: { $0.name == ancestor.name }) {
        sharedAncestor = foundAncestor
        break
      }
    }

    guard sharedAncestor != nil else {
      fatalError("no shared ancestor!")
    }

    // count distance between objectA and shared ancestor
    let transfersA = objectAAncestors.firstIndex(where: { $0.name == sharedAncestor!.name })!

    // count distance between object B and shared ancestor
    let transfersB = objectBAncestors.firstIndex(where: { $0.name == sharedAncestor!.name })!

    // add together
    return transfersA + transfersB
  }

  public func orbitCountChecksum() -> Int {
    _orbitalObjects
      .reduce(0, { $0 + $1.totalOrbits() })
  }

  public func totalOrbitsOf(_ orbitalObjectName: String) -> Int {
    _objectBy(orbitalObjectName)!
      .totalOrbits()
  }

}

extension OrbitalMap {

  private func _objectBy(_ name: String) -> OrbitalObject? {
    _orbitalObjects
      .first(where: { $0.name == name })
  }

}
