import XCTest
@testable import YBS

final class StringExtensionTests: XCTestCase {

    func testStripHTML() {
        // Given
        let htmlString = "<p>This is a <strong>test</strong> string with <a href=\"https://example.com\">HTML</a> content.</p>"
        let expectedResult = "This is a test string with HTML content."
        
        let emptyHTMLString = "<p></p>"
        let expectedEmptyResult = ""
        
        let nestedHTMLString = "<div><p>Nested <span>HTML</span> content.</p></div>"
        let expectedNestedResult = "Nested HTML content."
        
        let plainTextString = "This is plain text without HTML tags."
        let expectedPlainTextResult = "This is plain text without HTML tags."
        
        // When
        let strippedString = htmlString.stripHTML()
        let strippedEmptyString = emptyHTMLString.stripHTML()
        let strippedNestedString = nestedHTMLString.stripHTML()
        let strippedPlainTextString = plainTextString.stripHTML()
        
        // Then
        XCTAssertEqual(strippedString, expectedResult, "HTML should be stripped correctly")
        XCTAssertEqual(strippedEmptyString, expectedEmptyResult, "Empty HTML tags should result in an empty string")
        XCTAssertEqual(strippedNestedString, expectedNestedResult, "Nested HTML tags should be stripped correctly")
        XCTAssertEqual(strippedPlainTextString, expectedPlainTextResult, "Plain text should remain unchanged")
    }
}
