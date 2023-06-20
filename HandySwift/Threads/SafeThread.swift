//
//  SafeThread.swift
//  HandySwift
//
//  Created by Lusine Magauzyan on 15.05.23.
//

import Foundation

struct SafeThread {
    static let lock = NSRecursiveLock()
    
    static func threadSafeWork(work : () -> ()) {
        lock.lock()
        work()
        defer {
            lock.unlock()
        }
    }
}
