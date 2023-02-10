//
//  HomeScreenViewModel.swift
//  Coctails App
//
//  Created by Nikola on 10.2.23..
//

import Foundation

public final class HomeScreenViewModel: ObservableObject {
    
    private let loader: HomeScreenLoader
    @Published public private(set) var coctails: [CoctailItemModel] = [CoctailItemModel]()
    
    init(loader: HomeScreenLoader,
         coctails: [CoctailItemModel] = [CoctailItemModel]()) {
        self.coctails = coctails
        self.loader = loader
    }
    
    // MARK: - Public Function
    public func getLates() {
        loader.getCoctailDetails { [weak self] result in
            switch result {
            case .failure(let error):
                print("Error has occured: \(error)")
            case .success(let response):
                DispatchQueue.main.async {
                    self?.coctails = Mapper.map(from: response)
                }
            }
        }
    }
    
    private class Mapper {
        static func map(from response: CoctailDetailsResponse) -> [CoctailItemModel] {
            return response.drinks.map({
                CoctailItemModel(image: $0.strDrinkThumb ?? "",
                                 title: $0.strDrink ?? "",
                                 coctailType: $0.strAlcoholic ?? "",
                                 ingredients: "")
            })
        }
    }
}
