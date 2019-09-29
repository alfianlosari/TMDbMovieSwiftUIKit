# TMDBMovieSwiftUIKit

A TMDb SwiftUI View and View Model wrapper using TMDbMovieKit Library

## Installation
- Add the dependency to your target/project using Swift Package Manager
- Import framework in your source

## Features
1. MovieListViewModel: an Observable Object that publishes movies, error, and isLoading propery. trigger fetching by invoking loadMovies passing the endpoint
2. MovieViewModel: an Observable object that publishes movie, error, and isLoading property. trigger fetching by invoking loadMovie passing the movieId
3. MovieListView: A SwiftUI List wrapping the MovieListViewModel
4. MovieView: A SwiftUI View wrapping the MovieViewModel
