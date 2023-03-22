//
//  String+HandySwift.swift
//  HandySwift
//
//  Created by Lusine Magauzyan on 11.01.23.
//

import Foundation

extension String: Error, LocalizedError {
    public var errorDescription: String? { return self }
}
