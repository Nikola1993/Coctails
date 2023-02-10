//
//  HomeScreen.swift
//  Coctails App
//
//  Created by Nikola on 9.2.23..
//

import SwiftUI

struct HomeScreen: View {
    
    @ObservedObject private var viewModel: HomeScreenViewModel
    
    init(viewModel: HomeScreenViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        BackgroundView {
            ScrollView {
                ForEach(viewModel.coctails) { coctail in
                    CoctailItemView(model: coctail)
                }
            }
        }
        .onAppear {
            viewModel.getLates()
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen(viewModel: HomeScreenViewModel(loader: StubHomeScreenLoader(),
                                                  coctails: MockCoctailItemModels.items))
    }
    
    private class StubHomeScreenLoader: HomeScreenLoader {
        func getCoctailDetails(completion: @escaping (ResultCoctailDetails) -> Void) {
        }
    }
}
