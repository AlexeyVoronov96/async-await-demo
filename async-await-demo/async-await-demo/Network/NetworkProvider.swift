//
//  NetworkProvider.swift
//  async-await-demo
//
//  Created by Алексей Воронов on 04.07.2021.
//

import Foundation

extension NetworkProvider {
    
    enum Errors: LocalizedError {
        case requestError
        case invalidURL
        case wrongResponse
        
        var errorDescription: String? { "Something goes wrong." }
    }
}

class NetworkProvider<T: Endpoint> {
    
    private let decoder: JSONDecoder
    
    init(decoder: JSONDecoder = JSONDecoder()) {
        self.decoder = decoder
    }
    
    func getData<Model: Decodable>(from endpoint: T) async throws -> Model {
        let request = try performRequest(for: endpoint)
        
        let data = try await loadData(with: request)
        let decodedData = try decoder.decode(Model.self, from: data)
        
        return decodedData
    }
}

private extension NetworkProvider {
    
    // MARK: - Request building
    func performRequest(for endpoint: T) throws -> URLRequest {
        guard var urlComponents = URLComponents(string: endpoint.baseURL + endpoint.path) else {
            throw Errors.invalidURL
        }
        
        urlComponents.queryItems = endpoint.params
            .compactMap { param -> URLQueryItem? in
                .init(name: param.key, value: param.value)
            }
        
        guard let url = urlComponents.url else {
            throw Errors.invalidURL
        }
        
        var urlRequest = URLRequest(
            url: url,
            cachePolicy: .reloadRevalidatingCacheData,
            timeoutInterval: 30
        )
        
        endpoint.headers
            .forEach { urlRequest.setValue($0.value, forHTTPHeaderField: $0.key) }
        
        return urlRequest
    }
    
    // MARK: - Getting data
    func loadData(with request: URLRequest) async throws -> Data {
        let (data, response) = try await URLSession.shared.data(for: request)
        guard (200..<300).contains((response as! HTTPURLResponse).statusCode) else {
            throw Errors.wrongResponse
        }
        return data
    }
}
