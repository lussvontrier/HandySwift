//
//  Optional+HandySwift.swift
//  HandySwift
//
//  Created by Lusine Magauzyan on 06.07.22.
//

/// Allows to match for optionals with generics that are defined as non-optional.
public protocol AnyOptional {
    /// Returns `true` if `nil`, otherwise `false`.
    var isNil: Bool { get }
}
extension Optional: AnyOptional {
    public var isNil: Bool { self == nil }
}
