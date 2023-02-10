//
//  HomeScreenViewModel.swift
//  Coctails App
//
//  Created by Nikola on 10.2.23..
//

import Foundation

public final class HomeScreenViewModel {
    
    private let loader: HomeScreenLoader
    
    init(loader: HomeScreenLoader) {
        self.loader = loader
    }
    
    // MARK: - Public Function
    public func getLates() {
        loader.getCoctailDetails { result in
            switch result {
            case .failure(let error):
                print("Error has occured: \(error)")
            case .success(let response):
                print("Success response: \(response)")
            }
        }
    }
}
