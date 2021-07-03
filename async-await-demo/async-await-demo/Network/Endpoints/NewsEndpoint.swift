//
//  NewsEndpoint.swift
//  async-await-demo
//
//  Created by Алексей Воронов on 04.07.2021.
//

import Foundation

enum NewsEndpoint {
    
    case getTopHeadlines
}

extension NewsEndpoint: Endpoint {
    
    var baseURL: String { "https://newsapi.org/v2" }
    
    var path: String {
        switch self {
        case .getTopHeadlines:
            return "/top-headlines"
        }
    }
    
    var params: [String: String] {
        switch self {
        case .getTopHeadlines:
            return ["region": region]
        }
    }
    
    var headers: [String: String] {
        [
            "X-Api-Key": Settings.apiKey,
            "Content-type": "application/json",
            "Accept": "application/json"
        ]
    }
}
