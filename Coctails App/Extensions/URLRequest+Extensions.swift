//
//  URLRequest+Extensions.swift
//  Coctails App
//
//  Created by Nikola on 10.2.23..
//

import Foundation

extension URLRequest {
    
    public enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
        case delete = "DELETE"
        case pathc = "PATCH"
    }
    
    public init(url: URL,
                with method: HTTPMethod,
                withApiKeys: Bool = true) {
        self.init(url: url)
        self.httpMethod = method.rawValue
        self.setValue(APIConstants.rapidApiKey, forHTTPHeaderField: "X-RapidAPI-Key")
        self.setValue(APIConstants.rapidApiHost, forHTTPHeaderField: "X-RapidAPI-Host")
    }
}
