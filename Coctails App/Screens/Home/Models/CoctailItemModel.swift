//
//  CoctailItemModel.swift
//  Coctails App
//
//  Created by Nikola on 10.2.23..
//

import Foundation

public final class CoctailItemModel: Identifiable {
    public let image: String
    public let title: String
    public let coctailType: String
    public let ingredients: String
    
    init(image: String,
         title: String,
         coctailType: String,
         ingredients: String) {
        self.image = image
        self.title = title
        self.coctailType = coctailType
        self.ingredients = ingredients
    }
}
