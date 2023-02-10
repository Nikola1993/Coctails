//
//  BackgroundView.swift
//  Coctails App
//
//  Created by Nikola on 10.2.23..
//

import SwiftUI

struct BackgroundView<Content: View>: View {
    
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            Color.black
            content
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(content: {
            Text("Some text")
        })
    }
}
