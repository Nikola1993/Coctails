//
//  HomeScreen.swift
//  Coctails App
//
//  Created by Nikola on 9.2.23..
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        BackgroundView {
            Text("Home Screen")
                .foregroundColor(.white)
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
