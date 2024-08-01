//
//  InjectedValues.swift
//
//
//  Created by Tomas Harkema on 05/10/2023.
//

// import Foundation

/// Provides access to injected dependencies.
public struct InjectedValues: Sendable {
  /// This is only used as an accessor to the computed properties within extensions of
  /// `InjectedValues`.
  private static var current = InjectedValues()

  /// A static subscript for updating the `currentValue` of `InjectionKey` instances.
  public static subscript<KeyType>(key: KeyType.Type) -> KeyType.Value where KeyType: InjectionKey {
    get {
      if let currentValue = key.currentValue {
        return currentValue
      }
      
      // error
      fatalError("\(key) not set!")
    }
    set {
      key.currentValue = newValue
    }
  }
  
  /// A static subscript accessor for updating and references dependencies directly.
  public static subscript<KeyPathType>(
    _ keyPath: WritableKeyPath<InjectedValues, KeyPathType>
  ) -> KeyPathType {
    get {
      current[keyPath: keyPath]
    }
    set {
      current[keyPath: keyPath] = newValue
    }
  }
  
  public static func get<KeyPathType>(
    _ keyPath: KeyPath<InjectedValues, KeyPathType>
  ) -> KeyPathType {
    current[keyPath: keyPath]
  }
  
  public static func set<KeyType>(
    _ key: KeyType.Type,
    value: KeyType.Value
  ) where KeyType: InjectionKey {
    Self[key] = value
  }
}
