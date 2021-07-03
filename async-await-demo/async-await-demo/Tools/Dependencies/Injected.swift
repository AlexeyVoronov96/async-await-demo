//
//  Injected.swift
//  async-await-demo
//
//  Created by Алексей Воронов on 04.07.2021.
//

import Foundation

@propertyWrapper class Injected<T> {
    
    private var storage: T?
    
    private let dependencyStore: DependencyStore
    
    public init() {
        dependencyStore = DependencyStore.shared
    }
    
    public var wrappedValue: T {
        if let storage = storage { return storage }
        let object: T = dependencyStore.resolve()
        self.storage = object
        return object
    }
}
