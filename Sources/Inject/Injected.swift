//
//  Injected.swift
//
//
//  Created by Tomas Harkema on 05/10/2023.
//

import Foundation
import SwiftUI

@propertyWrapper
public struct Injected<InjectedType> {
  private let keyPath: KeyPath<InjectedValues, InjectedType>
  
  public var wrappedValue: InjectedType {
    InjectedValues.get(keyPath)
  }
  
  public init(_ keyPath: KeyPath<InjectedValues, InjectedType>) {
    self.keyPath = keyPath
  }
}

extension Injected: @unchecked Sendable { }
extension KeyPath: @unchecked Sendable { }
