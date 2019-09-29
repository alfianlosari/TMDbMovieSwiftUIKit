// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TMDBMovieSwiftUIKit",
    platforms: [
        .macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6)
    ],
    products: [
        .library(
            name: "TMDBMovieSwiftUIKit",
            targets: ["TMDBMovieSwiftUIKit"]),
    ],
    dependencies: [
        .package(
                   url: "https://github.com/alfianlosari/TMDbMovieKit.git",
                   from: "1.0.4"
               )
    ],
    targets: [
        .target(
            name: "TMDBMovieSwiftUIKit",
            dependencies: ["TMDbMovieKit"]),
        .testTarget(
            name: "TMDBMovieSwiftUIKitTests",
            dependencies: ["TMDBMovieSwiftUIKit", "TMDbMovieKit"]),
    ]
)
