//
//  File.swift
//  
//
//  Created by Alfian Losari on 29/09/19.
//

import Combine
import TMDbMovieKit

public final class MovieViewModel: ObservableObject {
    
    @Published public private(set) var movie: Movie?
    @Published public private(set) var isLoading = false
    @Published public private(set) var error: Error?
    
    private let movieStore: MovieStore
    
    public init(apiKey: String) {
        self.movieStore = MovieStore(apiKey: apiKey)
    }
    
    public func loadMovie(with id: Int) {
        isLoading = false
        error = nil
        movie = nil
        
        movieStore.fetchMovie(id: id, successHandler: { [weak self](movie) in
            self?.isLoading = false
            self?.movie = movie
        }) {[weak self] (error) in
            self?.isLoading = false
            self?.error = error
        }
    }
}
