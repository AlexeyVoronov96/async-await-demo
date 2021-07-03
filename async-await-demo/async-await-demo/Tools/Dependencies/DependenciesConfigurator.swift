//
//  DependenciesConfigurator.swift
//  async-await-demo
//
//  Created by Алексей Воронов on 04.07.2021.
//

import Foundation

final class DependenciesConfigurator {
    
    static func registerDependencies() {
        let store = DependencyStore.shared
        
        // News API Provider
        store.register(
            NetworkProvider<NewsEndpoint>(), for: NetworkProvider<NewsEndpoint>.self
        )
    }
}
