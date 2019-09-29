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
                            .font(.headline)
                        if (self.movieViewModel.movie!.runtimeText != nil) {
                            Text(self.movieViewModel.movie!.runtimeText!)
                                .font(.subheadline)
                        }
                        Text(self.movieViewModel.movie!.releaseDateText)
                            .font(.subheadline)
                        if (self.movieViewModel.movie!.genreText != nil) {
                            Text(self.movieViewModel.movie!.genreText!)
                                .font(.subheadline)
                        }
                        
                        Text(self.movieViewModel.movie!.ratingText)
                            .font(.subheadline)
                        if (self.movieViewModel.movie!.tagline != nil) {
                            Text(self.movieViewModel.movie!.tagline!)
                                .font(.subheadline)
                        }
                    }
                    
                    
                    Section {
                        Text(self.movieViewModel.movie!.overview)
                            .lineLimit(nil)
                            .font(.body)
                    }
                    
                    if (self.movieViewModel.movie!.castText != nil) {
                        Section(header: Text("Casts")) {
                            Text(self.movieViewModel.movie!.castText!)
                                .lineLimit(nil)
                                .font(.body)
                        }
                    }
                    
                    if (self.movieViewModel.movie!.crewText != nil) {
                        Section(header: Text("Crews")) {
                            Text(self.movieViewModel.movie!.crewText!)
                                .lineLimit(nil)
                                .font(.body)
                        }
                    }
                }
            }
        }
        .onAppear {
            self.movieViewModel.loadMovie(with: self.id)
        }
    }
}
