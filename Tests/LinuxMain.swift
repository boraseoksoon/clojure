import XCTest

import ClojureTests

var tests = [XCTestCaseEntry]()
tests += ClojureTests.allTests()
XCTMain(tests)
