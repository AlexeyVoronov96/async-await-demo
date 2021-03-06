//
//  NewsService.swift
//  async-await-demo
//
//  Created by Алексей Воронов on 04.07.2021.
//

import Foundation

protocol NewsServiceProtocol {
    
    func getTopArticles() async throws -> Articles
}

class NewsService: NewsServiceProtocol {
    
    @Injected var apiProvider: NetworkProvider<NewsEndpoint>
    
    func getTopArticles() async throws -> Articles {
        let response: ArticlesResponse = try await apiProvider.getData(from: .getTopHeadlines)
        return response.articles
    }
}
