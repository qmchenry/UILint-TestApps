//
//  LintyUIKitDemoUITests.swift
//  LintyUIKitDemoUITests
//
//  Created by Quinn McHenry on 5/22/20.
//  Copyright © 2020 Quinn McHenry. All rights reserved.
//

import XCTest
import UILint

class LintyUIKitDemoUITests: XCTestCase {

    func performUILint(app: XCUIApplication, attachReport: Bool = false) {
        let element = app.windows.children(matching: .other).element.children(matching: .other)
            .element.children(matching: .other).element
        element.tap(withNumberOfTaps: 2, numberOfTouches: 2)

        let exists = NSPredicate(format: "exists == 1")
        expectation(for: exists, evaluatedWith: app.navigationBars["UIActivityContentView"], handler: nil)
        waitForExpectations(timeout: 50, handler: nil)
        app.navigationBars["UIActivityContentView"].buttons["Close"].tap()

        if attachReport {
            let url = URL(fileURLWithPath: "/tmp/uilint-report.pdf")
            let attachment = XCTAttachment(contentsOfFile: url)
            attachment.lifetime = .keepAlways
            add(attachment)
        }
    }
    
    func testUILintExample() throws {
        let app = XCUIApplication()
        app.launch()
        performUILint(app: app, attachReport: true)
    }

}
