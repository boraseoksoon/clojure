import XCTest
@testable import Clojure

final class ClojureTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        // XCTAssertEqual(Clojure().text, "Hello, World!")
        
        Clojure().Take()
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
