//
//  DependencyStore.swift
//  async-await-demo
//
//  Created by Алексей Воронов on 04.07.2021.
//

import Foundation

final class DependencyStore {

    static let shared = DependencyStore()

    private init() {}

    /// A map of `identifier(for:)` to initializers
    private var store: [Identifier: () -> Any] = [:]

    func resolve<T>() -> T {
        let id = identifier(for: T.self)

        guard let initializer = store[id] else {
            fatalError("Could not resolve for \(T.self) - did you forget to `DependencyStore.register(_:)` a concrete type?")
        }

        guard let value = initializer() as? T else {
            // Never happens due to the register function being generic - this is needed only because `store.value` is `Any`
            fatalError("Could not cast \(initializer()) to \(T.self)")
        }

        return value
    }

    /// Registers a concrete dependency against protocol `T`.
    /// ```
    /// DependencyStore.register(Something(), for: SomethingType.self)
    /// ```
    public func register<T>(_ dependency: @escaping @autoclosure () -> T, for type: T.Type) {
        let id = identifier(for: T.self)
        store[id] = dependency
    }

}

private extension DependencyStore {

    typealias Identifier = String

    /// Generates a unique identifier for the given type
    func identifier<T>(for protocol: T) -> Identifier {
        String(describing: T.self)
    }
}
