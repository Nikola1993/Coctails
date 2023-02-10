//
//  CoctailDetailsResponse.swift
//  Coctails App
//
//  Created by Nikola on 10.2.23..
//

import Foundation

struct CoctailDetailsResponse: Codable {
    
    let drinks: [CoctailResponse]
    
    struct CoctailResponse: Codable {
        let strDrink: String?
        let strDrinkThumb: String?
        let strAlcoholic: String?
        let strIngredient1: String?
        let strIngredient2: String?
        let strIngredient3: String?
        let strIngredient4: String?
        let strIngredient5: String?
        let strIngredient6: String?
        let strIngredient7: String?
        let strIngredient8: String?
        let strIngredient9: String?
        let strIngredient10: String?
        let strIngredient11: String?
        let strIngredient12: String?
        let strIngredient13: String?
        let strIngredient14: String?
        let strIngredient15: String?
    }
}
