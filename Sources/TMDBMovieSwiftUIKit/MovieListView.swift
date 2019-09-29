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
    private let apiKey: String
    @State var showingMovie = false
    var selectedId: Int?

    
    public init(apiKey: String, endpoint: MovieEndpoint) {
        self.apiKey = apiKey
        self.movieListViewModel = MovieListViewModel(apiKey: apiKey)
        self.endpoint = endpoint
    }
    
    public var body: some View {
        #if os(watchOS)
        return List(movieListViewModel.movies) { movie in
            VStack {
                Text(movie.title)
                    .font(.subheadline)
                Text(movie.overview)
                    .font(.caption)
                    .lineLimit(2)
            }
            .onTapGesture {
                self.selectedId = movie.id
                self.showingMovie.toggle()
            }
        }
        .sheet(isPresented: $showingMovie) {
            guard self.selectedId = selectedId else { return }
            MovieView(apiKey: self.apiKey, id: selectedId)
        }
        .onAppear {
            self.movieListViewModel.loadMovies(from: self.endpoint)
        }
        #else
        return NavigationView {
            List(movieListViewModel.movies) { movie in
                NavigationLink(destination: MovieView(apiKey: self.apiKey, id: movie.id)) {
                    VStack {
                        Text(movie.title)
                            .font(.subheadline)
                        Text(movie.overview)
                            .font(.caption)
                            .lineLimit(2)
                    }
                }
            }
            .onAppear {
                self.movieListViewModel.loadMovies(from: self.endpoint)
            }
        }
        #endif
    }
}
