//
//  ContentView.swift
//  Popular Movies
//
//  Created by Idorenyin Obong on 26/06/2020.
//  Copyright © 2020 Idorenyin Obong. All rights reserved.
//


import SwiftUI

struct ContentView: View {
    
   @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        NavigationView {
            VStack {
                if networkManager.loading {
                    Text("Loading ...")
                } else {
                    List(networkManager.movies.results) {
                        movie in
                        MovieRow(movie: movie)
                    }
                }
                    
                
            }
            .navigationBarTitle(Text("Popular Movies"))
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
