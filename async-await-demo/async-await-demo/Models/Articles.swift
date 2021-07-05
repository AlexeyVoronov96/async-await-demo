//
//  Articles.swift
//  async-await-demo
//
//  Created by Алексей Воронов on 04.07.2021.
//

import Foundation

struct ArticlesResponse: Decodable {
    let articles: Articles
}

typealias Articles = [Article]
struct Article: Decodable {
    let author: String?
    let title: String?
    let description: String?
    let url: URL
    let urlToImage: String?
}

extension Article: Identifiable {
    
    var id: String {
        (title ?? "") + (description ?? "")
    }
}
