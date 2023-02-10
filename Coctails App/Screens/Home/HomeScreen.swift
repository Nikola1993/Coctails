//
//  HomeScreen.swift
//  Coctails App
//
//  Created by Nikola on 9.2.23..
//

import SwiftUI

struct HomeScreen: View {
    
    private let viewModel: HomeScreenViewModel
    
    init(viewModel: HomeScreenViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        BackgroundView {
            Text("Home Screen")
                .foregroundColor(.white)
        }
        .onAppear {
            viewModel.getLates()
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen(viewModel: HomeScreenViewModel(loader: StubHomeScreenLoader()))
    }
    
    private class StubHomeScreenLoader: HomeScreenLoader {
        func getCoctailDetails(completion: @escaping (ResultCoctailDetails) -> Void) {
        }
    }
}
