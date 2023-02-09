//
//  HTTPClient.swift
//  Coctails App
//
//  Created by Nikola on 9.2.23..
//

import Foundation

public protocol HTTPClient {
    typealias Result<T: Codable> = Swift.Result<T, Error>
    func perform<T: Codable>(from request: URLRequest, _ responseType: T.Type, completion: @escaping (Result<T>) -> Void)
}
