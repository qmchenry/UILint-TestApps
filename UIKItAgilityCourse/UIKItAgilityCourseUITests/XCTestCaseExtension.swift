//
//  XCTestCaseExtension.swift
//
//  Created by Quinn McHenry on 7/9/20.
//

import XCTest

private let uiLintSingleResultsURL = URL(fileURLWithPath: "/tmp/uilint-results.txt")
private let uiLintSingleReportURL = URL(fileURLWithPath: "/tmp/uilint-report.pdf")
private func uiLintSingleReportSummary() -> String {
    (try? String(contentsOf: uiLintSingleResultsURL)) ?? ""
}

extension XCTestCase {

    @discardableResult func performUILint(app: XCUIApplication) -> XCTAttachment {
        let element = app.windows.children(matching: .other).element.children(matching: .other)
            .element.children(matching: .other).element
        element.tap(withNumberOfTaps: 2, numberOfTouches: 2)

        let exists = NSPredicate(format: "exists == 1")
        expectation(for: exists, evaluatedWith: app.navigationBars["UIActivityContentView"], handler: nil)
        waitForExpectations(timeout: 50, handler: nil)
        app.navigationBars["UIActivityContentView"].buttons["Close"].tap()

        return XCTAttachment(contentsOfFile: uiLintSingleReportURL)
    }

}

extension XCTest {

    func XCTAssertUILintClean(_ message: @autoclosure () -> String = "",
                              file: StaticString = #filePath, line: UInt = #line) {
        let summary = uiLintSingleReportSummary()
        let sentMessage = message()
        let assertMessage = sentMessage == "" ? "UILint returned: \(summary)" : sentMessage
        XCTAssert(summary == "No findings", assertMessage, file: file, line: line)
    }

}
