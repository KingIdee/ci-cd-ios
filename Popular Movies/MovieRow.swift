//
//  MovieRow.swift
//  Popular Movies
//
//  Created by Idorenyin Obong on 28/06/2020.
//  Copyright © 2020 Idorenyin Obong. All rights reserved.
//

import Foundation

import URLImage
import SwiftUI

struct MovieRow : View {
    
    var movie: Movie
    
    let BASE_IMAGE_URL = "https://image.tmdb.org/t/p/original/"

    var body: some View {
        
        VStack {
            
            URLImage(URL(string:  "\(BASE_IMAGE_URL)\(movie.poster_path)")!, delay: 0.25) { proxy in
                proxy.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: Alignment.topLeading)
                
            }
        
            Spacer()
                HStack {
                    Text(movie.title)
                        .foregroundColor(.blue)
                        .lineLimit(nil)
                    Spacer()
                }
                HStack {
                    Text(movie.release_date).foregroundColor(.gray)
                    Spacer()
                    Text("Rate: \(movie.vote_average.format())")
                }
                HStack {
                    Text("Vote count: \(movie.vote_count)")
                        .foregroundColor(.gray)
                        .lineLimit(nil)
                    Spacer()
                }
                HStack {
                    Text("Popularity: \(movie.popularity)")
                        .foregroundColor(.gray)
                        .lineLimit(nil)
                    Spacer()
                }
                Spacer()
            
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: Alignment.topLeading)
    }
    
}

extension Float {
    func format() -> String {
        return String(format: "%.2f",self)
    }
}
