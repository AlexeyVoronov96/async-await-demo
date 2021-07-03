//
//  async_await_demoApp.swift
//  async-await-demo
//
//  Created by Алексей Воронов on 04.07.2021.
//

import SwiftUI

@main
struct async_await_demoApp: App {
    
    init() {
        DependenciesConfigurator.registerDependencies()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
