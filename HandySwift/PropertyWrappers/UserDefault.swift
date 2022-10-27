//
//  UserDefault.swift
//  HandySwift
//
//  Created by Lusine Magauzyan on 06.07.22.
//

import Foundation

@propertyWrapper
struct UserDefault<Value> {
    let key: String
    let defaultValue: Value
    let container: UserDefaults = .standard
    
    var wrappedValue: Value {
        get {
            return container.object(forKey: key) as? Value ?? defaultValue
        }
        set {
            container.set(newValue, forKey: key)
        }
    }
}

extension UserDefault where Value: ExpressibleByNilLiteral {
    
    /// Creates a new User Defaults property wrapper for the given key.
    /// - Parameters:
    ///   - key: The key to use with the user defaults store.
    init(key: String) {
        self.init(key: key, defaultValue: nil)
    }
}

