//
//  MainViewModel.swift
//  async-await-demo
//
//  Created by Алексей Воронов on 04.07.2021.
//

import Foundation

final class MainViewModel: ObservableObject {
    
    @Injected var newsService: NewsServiceProtocol
    
    @Published private(set) var topHeadlines: Articles = []
    
    func getArticles() async {
        do {
            topHeadlines = try await newsService.getTopArticles()
        } catch {
            print(error.localizedDescription)
        }
    }
}
