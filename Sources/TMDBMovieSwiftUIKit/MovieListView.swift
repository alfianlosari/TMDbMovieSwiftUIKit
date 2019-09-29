//
//  File.swift
//  
//
//  Created by Alfian Losari on 29/09/19.
//

import SwiftUI
import TMDbMovieKit

public struct MovieListView: View {
    
    @ObservedObject private var movieListViewModel: MovieListViewModel
    private let endpoint: MovieEndpoint
    
    init(apiKey: String, endpoint: MovieEndpoint) {
        self.movieListViewModel = MovieListViewModel(apiKey: apiKey)
        self.endpoint = endpoint
    }
    
    var body: some View {
        List(movieListViewModel.movies) { movie in
            Text(movie.title)
        }
        .onAppear {
            self.movieListViewModel.loadMovies(from: self.endpoint)
        }
    }
}
