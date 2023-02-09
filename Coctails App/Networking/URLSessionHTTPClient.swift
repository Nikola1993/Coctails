//
//  URLSessionHTTPClient.swift
//  Coctails App
//
//  Created by Nikola on 9.2.23..
//

import Foundation

public final class URLSessionHTTPClient: HTTPClient {
    
    private let session: URLSession
    
    public typealias Result<T: Codable> = Swift.Result<T, Error>
    
    public init(session: URLSession) {
        self.session = session
    }
    
    public func perform<T>(from request: URLRequest, _ responseType: T.Type, completion: @escaping (Result<T>) -> Void) where T : Decodable, T : Encodable {
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data, let response = response as? HTTPURLResponse {
                print(response)
                do {
                    let json = try JSONDecoder().decode(responseType, from: data)
                    completion(.success(json))
                } catch let error {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}
