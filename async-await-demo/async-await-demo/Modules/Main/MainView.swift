//
//  ContentView.swift
//  async-await-demo
//
//  Created by Алексей Воронов on 04.07.2021.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel: MainViewModel
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List(viewModel.topHeadlines, id: \.self) { article in
            Text(article.title ?? "")
        }
        .onAppear {
            async {
                await viewModel.getArticles()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainViewConfigurator.configure()
    }
}
