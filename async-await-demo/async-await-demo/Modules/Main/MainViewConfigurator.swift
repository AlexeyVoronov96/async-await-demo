//
//  MainViewConfigurator.swift
//  async-await-demo
//
//  Created by Алексей Воронов on 04.07.2021.
//

import SwiftUI

struct MainViewConfigurator {
    
    static func configure() -> some View {
        let viewModel = MainViewModel(newsService: NewsService())
        
        let view = MainView(viewModel: viewModel)
        
        return view
    }
}
