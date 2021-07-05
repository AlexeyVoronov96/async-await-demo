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
        GeometryReader { proxy in
            TabView(content: {
                ForEach(viewModel.topHeadlines) { article in
                    MainArticleView(article: article, geometryProxy: proxy)
                        .rotationEffect(.init(degrees: -90))
                }
            })
            .onAppear {
                getArticles()
            }
            .rotationEffect(.init(degrees: 90))
            .frame(width: proxy.size.height)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(width: proxy.size.width)
        }
        .ignoresSafeArea(.all, edges: .vertical)
        .preferredColorScheme(.dark)
    }
}

private extension MainView {
    
    func getArticles() {
        async {
            await viewModel.getArticles()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainViewConfigurator.configure()
    }
}
