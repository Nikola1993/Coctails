//
//  HomeScreenLoader.swift
//  Coctails App
//
//  Created by Nikola on 10.2.23..
//

import Foundation

protocol HomeScreenLoader {
    typealias ResultCoctailDetails = Swift.Result<CoctailDetailsResponse,Swift.Error>
    func getCoctailDetails(completion: @escaping (ResultCoctailDetails) -> Void)
}

public final class HomeScreenService: HomeScreenLoader {
    
    private let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func getCoctailDetails(completion: @escaping (ResultCoctailDetails) -> Void) {
        // TODO: - Create Custom errors if URL can't be created
        let url = URL(string: APIConstants.getLatest)!
        let request = URLRequest(url: url, with: .get)

        client.perform(from: request,
                       CoctailDetailsResponse.self) { result in
            completion(result)
        }
    }
}

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
