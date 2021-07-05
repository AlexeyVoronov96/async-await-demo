//
//  MainArticleView.swift
//  async-await-demo
//
//  Created by Алексей Воронов on 05.07.2021.
//

import SwiftUI

struct MainArticleView: View {
    
    private let article: Article
    private let proxy: GeometryProxy
    
    init(article: Article, geometryProxy: GeometryProxy) {
        self.article = article
        proxy = geometryProxy
    }
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: article.urlToImage ?? ""), scale: proxy.size.height / proxy.size.width) { phase in
                switch phase {
                case let .success(image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: proxy.size.width, height: proxy.size.height)
                case .empty:
                    ProgressView()
                default:
                    EmptyView()
                }
            }
            Rectangle()
                .foregroundColor(.black)
                .opacity(0.6)
            VStack(alignment: .leading, spacing: 8) {
                Spacer()
                Text(article.author ?? "")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                Text(article.title ?? "")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.bottom, 50)
            }
            .padding()
            .frame(width: proxy.size.width, height: proxy.size.height)
        }
    }
}

