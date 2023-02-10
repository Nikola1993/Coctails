//
//  ImageView.swift
//  Coctails App
//
//  Created by Nikola on 10.2.23..
//

import SwiftUI

struct ImageView: View {
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage()
    let placeholder: String

    init(withURL url:String, placeholder: String) {
        imageLoader = ImageLoader(urlString:url)
        self.placeholder = placeholder
    }

    var body: some View {
        Image(uiImage: UIImage(data: imageLoader.data) ?? UIImage())
            .resizable()
    }
}
