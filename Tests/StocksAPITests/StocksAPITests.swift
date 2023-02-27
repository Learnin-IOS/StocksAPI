import XCTest
@testable import StocksAPI

final class StocksAPITests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(StocksAPI().text, "Hello, World!")
    }
}
