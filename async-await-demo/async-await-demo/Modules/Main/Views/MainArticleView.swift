//
//  MainArticleView.swift
//  async-await-demo
//
//  Created by Алексей Воронов on 05.07.2021.
//

import SwiftUI

struct MainArticleView: View {
    
    private let article: Article
    private let size: CGSize
    
    init(article: Article, size: CGSize) {
        self.article = article
        self.size = size
    }
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: article.urlToImage ?? ""), scale: size.height / size.width) { phase in
                switch phase {
                case let .success(image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: size.height)
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
                Text((article.author ?? "").isEmpty ? "" : "\(article.author ?? ""):")
                    .foregroundColor(.white)
                    .font(.subheadline)
                Text(article.title ?? "")
                    .font(.title2)
                    .foregroundColor(.white)
            }
            .padding()
            .frame(width: size.width, height: size.height)
        }
    }
}
