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
    
    public init(apiKey: String, endpoint: MovieEndpoint) {
        self.movieListViewModel = MovieListViewModel(apiKey: apiKey)
        self.endpoint = endpoint
    }
    
    public var body: some View {
        List(movieListViewModel.movies) { movie in
            VStack {
                Text(movie.title)
                    .font(.subheadline)
                Text(movie.overview)
                    .font(.caption)
                .lineLimit(2)
            }
        }
        .onAppear {
            self.movieListViewModel.loadMovies(from: self.endpoint)
        }
    }
}
