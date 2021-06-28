import XCTest
@testable import ConfCore

final class ConfCoreTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ConfCore().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
