//
//  MainViewModel.swift
//  async-await-demo
//
//  Created by Алексей Воронов on 04.07.2021.
//

import Foundation

final class MainViewModel: ObservableObject {
    
    private let newsService: NewsServiceProtocol
    
    init(newsService: NewsServiceProtocol) {
        self.newsService = newsService
    }
    
    @Published private(set) var topHeadlines: [String] = []
    
    func getArticles() async {
        do {
            topHeadlines = try await newsService.getTopArticles()
        } catch {
            print(error.localizedDescription)
        }
    }
}
