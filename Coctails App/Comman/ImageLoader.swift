//
//  ImageLoader.swift
//  Coctails App
//
//  Created by Nikola on 10.2.23..
//

import Foundation
import Combine

class ImageLoader: ObservableObject {
    @Published public private(set) var data: Data = Data()

    init(urlString:String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
}
