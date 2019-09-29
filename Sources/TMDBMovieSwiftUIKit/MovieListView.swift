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
    @State var selectedId: Int?
    
    
    public init(apiKey: String, endpoint: MovieEndpoint) {
        self.apiKey = apiKey
        self.movieListViewModel = MovieListViewModel(apiKey: apiKey)
        self.endpoint = endpoint
    }
    
    
    #if os(watchOS)
    
    public var body: some View {
        List(movieListViewModel.movies) { movie in
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
            .sheet(isPresented: self.$showingMovie) {
                MovieView(apiKey: self.apiKey, id: self.selectedId ?? 0)
            }
            .onAppear {
                self.movieListViewModel.loadMovies(from: self.endpoint)
            }
        }
    }
    #else
    public var body: some View {
        NavigationView {
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
    }
    #endif
    
    
    
}
