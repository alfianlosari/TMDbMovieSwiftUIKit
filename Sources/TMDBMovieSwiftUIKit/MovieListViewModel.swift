//
//  File.swift
//  
//
//  Created by Alfian Losari on 29/09/19.
//

import Combine
import TMDbMovieKit

final class MovieListViewModel: ObservableObject {
    
    @Published public private(set) var movies = [Movie]()
    @Published public private(set) var isLoading = false
    @Published public private(set) var error: Error?
    
    private let movieStore: MovieStore
    
    public init(apiKey: String) {
        self.movieStore = MovieStore(apiKey: apiKey)
    }
    
    public func loadMovies(from endpoint: MovieEndpoint) {
        isLoading = false
        error = nil
        movies = []
        
        movieStore.fetchMovies(from: endpoint, successHandler: {[weak self] (response) in
            self?.isLoading = false
            self?.movies = response.results
        }) {[weak self] (error) in
            self?.isLoading = false
            self?.error = error
        }
    }
}
