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


