//
//  File.swift
//  
//
//  Created by Alfian Losari on 29/09/19.
//

import SwiftUI
import TMDbMovieKit

public struct MovieView: View {
    
    @ObservedObject private var movieViewModel: MovieViewModel
    private let id: Int
    
    public init(apiKey: String, id: Int) {
        self.movieViewModel = MovieViewModel(apiKey: apiKey)
        self.id = id
    }
    
    public var body: some View {
        Group {
            if (self.movieViewModel.movie != nil) {
                List {
                    Section {
                        Text(self.movieViewModel.movie!.title)
                            .font(.subheadline)
                        Text(self.movieViewModel.movie!.releaseDateText)
                            .font(.caption)
                        Text(self.movieViewModel.movie!.ratingText)
                            .font(.caption)
                        if (self.movieViewModel.movie!.tagline != nil) {
                            Text(self.movieViewModel.movie!.tagline!)
                                .font(.caption)
                        }
                    }
                    
                    Section {
                        Text(self.movieViewModel.movie!.overview)
                            .font(.body)
                    }
                }
            }
        }
        .onAppear {
            self.movieViewModel.loadMovie(with: self.id)
        }
    }
}
