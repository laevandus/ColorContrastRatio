import XCTest
@testable import ColorContrastRatio

final class ColorContrastRatioTests: XCTestCase {
    func testBlueOverWhiteContrastRatio() {
        let color1 = UIColor(red: 0, green: 0, blue: 1, alpha: 1)
        let color2 = UIColor.white
        let result = color1.contrastRatio(color2)
        XCTAssertEqual(result, 1.0 / 8.59, accuracy: 0.01, "Invalid contrast ratio")
    }

    static var allTests = [
        ("testExample", testBlueOverWhiteContrastRatio),
    ]
}
