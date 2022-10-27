//
//  UserDefaults+HandySwift.swift
//  HandySwift
//
//  Created by Lusine Magauzyan on 06.07.22.
//

import Foundation

//This extension is Handy because...
extension UserDefaults {
    @UserDefault(key: "has_seen_app_introduction", defaultValue: false)
    static var hasSeenAppIntroduction: Bool
    
    @UserDefault(key: "username", defaultValue: "Antoine van der Lee")
    static var username: String
    
    @UserDefault(key: "year_of_birth", defaultValue: 1990)
    static var yearOfBirth: Int
}
