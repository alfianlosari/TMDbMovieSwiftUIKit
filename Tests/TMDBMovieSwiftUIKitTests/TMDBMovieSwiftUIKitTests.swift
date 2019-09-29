import XCTest
@testable import TMDBMovieSwiftUIKit

final class TMDBMovieSwiftUIKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(TMDBMovieSwiftUIKit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
