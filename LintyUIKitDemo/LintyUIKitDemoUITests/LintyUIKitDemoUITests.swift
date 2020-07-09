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
    
    func testUILintExample() throws {
        let app = XCUIApplication()
        app.launch()
        performUILint(app: app, attachReport: true)
        XCTAssertUILintClean()
    }

}
