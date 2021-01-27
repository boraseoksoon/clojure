import XCTest
@testable import Clojure

final class ClojureTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        // XCTAssertEqual(Clojure().text, "Hello, World!")
        
        // Clojure => (map (fn [i] (str i "!\n")) (range 0 10))
        let res = Map(Array((0...10))) { String($0) + "\n!" }
        res

        // Clojure => (filter (fn [item] (= (mod item 2) 0)) (range 0 10))
        // => (0 2 4 6 8 10)
        let res2 = Filter(Array((0...10))) { $0.isMultiple(of: 2) }
        res2
        // => [0, 2, 4, 6, 8, 10]

        // Clojure => (reduce + (range 0 10))
        // => 45
        let res3 = Reduce(from: 0, sequence: Array((0...10))) { $0 + $1 }
        // => 55

        // Clojure => (take 3 (range 0 10))
        // (0 1 2)
        let res4 = Take(3, Array(0...10))
        res4
        // => [0,1,2]

        
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
