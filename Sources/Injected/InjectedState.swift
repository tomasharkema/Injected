//
//  InjectedState.swift
//  
//
//  Created by Tomas Harkema on 17/10/2023.
//

import Foundation
import SwiftUI
import Combine

@MainActor
@propertyWrapper
public struct InjectedState<InjectedType: ObservableObject>: DynamicProperty {
  
  private let keyPath: KeyPath<InjectedValues, InjectedType>
  
  @StateObject
  private var observed: InjectedType
  
  public var wrappedValue: InjectedType {
    observed
  }
  
  public init(_ keyPath: KeyPath<InjectedValues, InjectedType>) {
    self.keyPath = keyPath
    _observed = .init(wrappedValue: InjectedValues.get(keyPath))
  }
}

extension InjectedState: @unchecked Sendable { }

@MainActor
@propertyWrapper
public struct InjectedObserving<InjectedType: Observable>: DynamicProperty {

  private let keyPath: KeyPath<InjectedValues, InjectedType>

  @State
  private var observed: InjectedType

  public var wrappedValue: InjectedType {
    observed
  }

  public init(_ keyPath: KeyPath<InjectedValues, InjectedType>) {
    self.keyPath = keyPath
    _observed = .init(wrappedValue: InjectedValues.get(keyPath))
  }
}

extension InjectedObserving: @unchecked Sendable { }
