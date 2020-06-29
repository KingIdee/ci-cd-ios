//
//  Movie.swift
//  Popular Movies
//
//  Created by Idorenyin Obong on 28/06/2020.
//  Copyright © 2020 Idorenyin Obong. All rights reserved.
//

struct MovieList: Decodable {
    var results: [Movie]
}

struct Movie: Decodable, Identifiable {
    var popularity: Float
    var vote_count: Int
    var id: Int
    var vote_average: Float
    var title: String
    var poster_path: String
    var original_language: String
    var original_title: String
    var adult: Bool
    var overview: String
    var release_date: String
}
