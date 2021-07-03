//
//  Endpoint.swift
//  async-await-demo
//
//  Created by Алексей Воронов on 04.07.2021.
//

import Foundation

protocol Endpoint {
    
    var baseURL: String { get }
    var path: String { get }
    var params: [String: String] { get }
    var headers: [String: String] { get }
    
    var region: String { get }
}

extension Endpoint {
    
    var region: String {
        return Locale.current.regionCode ?? "us"
    }
}
