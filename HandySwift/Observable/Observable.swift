//
//  Observable.swift
//  HandySwift
//
//  Created by Lusine Magauzyan on 20.06.23.
//

import Foundation

class Observable<T> {
    typealias Listener = (T?) -> Void
    var listeners: [Listener] = []
    var onceListeners: [Listener] = []
    
    var value: T? {
        didSet {
            for listener in listeners {
                listener(value)
            }
            for listener in onceListeners {
                listener(value)
            }
            self.onceListeners = []
        }
    }
    
    init(_ value: T? = nil) {
        self.value = value
    }
    
    func bind(listener: @escaping Listener) {
        self.listeners.append(listener)
    }
    
    func bindOnce(listener: @escaping Listener) {
        self.onceListeners.append(listener)
    }
}

