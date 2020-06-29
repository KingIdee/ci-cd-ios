//
//  NetworkManager.swift
//  Popular Movies
//
//  Created by Idorenyin Obong on 28/06/2020.
//  Copyright © 2020 Idorenyin Obong. All rights reserved.
//

import Alamofire
import Foundation
import Combine


class NetworkManager: ObservableObject {
    
    @Published var movies = MovieList(results: [])
    @Published var loading = false
    
    private let api_key = "your_api_key"
    private let api_url_base = "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key="
    
    init() {
        loading = true
        fetchData()
    }
    
    private func fetchData() {
        AF.request("\(api_url_base)\(api_key)")
            .responseJSON{ response in
                guard let data = response.data else { return }
                let movies = try! JSONDecoder().decode(MovieList.self, from: data)
                DispatchQueue.main.async {
                    self.movies = movies
                    self.loading = false
                }
        }
    }
}
