//
//  CoctailItemView.swift
//  Coctails App
//
//  Created by Nikola on 10.2.23..
//

import SwiftUI

struct CoctailItemView: View {
    
    private let model: CoctailItemModel
    
    init(model: CoctailItemModel) {
        self.model = model
    }
    
    var body: some View {
        HStack {
            ImageView(withURL: model.image, placeholder: "")
                .scaledToFit()
                .frame(width: 100, height: 100)
                .cornerRadius(12)
            
            VStack(alignment: .leading, spacing: 7) {
                Text(model.title)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.brownColor)
                Text(model.coctailType)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(model.ingredients)
                    .font(.footnote)
                    .foregroundColor(.white)
            }
            Spacer()
        }
        .padding()
    }
}

struct CoctailItemView_Previews: PreviewProvider {
    static var previews: some View {
        let model = MockCoctailItemModels.items[0]
        BackgroundView {
            CoctailItemView(model: model)
        }
    }
}
