//
//  UIKItAgilityCourseUITests.swift
//  UIKItAgilityCourseUITests
//
//  Created by Quinn McHenry on 7/9/20.
//

import XCTest

class UIKItAgilityCourseUITests: XCTestCase {

    let textSizes = [
        "Default text size":
            [],
        "Text size XS":
            ["-UIPreferredContentSizeCategoryName", "UICTContentSizeCategoryXS"],
        "Text size S":
            ["-UIPreferredContentSizeCategoryName", "UICTContentSizeCategoryS"],
        "Text size M":
            ["-UIPreferredContentSizeCategoryName", "UICTContentSizeCategoryM"],
        "Text size L":
            ["-UIPreferredContentSizeCategoryName", "UICTContentSizeCategoryL"],
        "Text size XL":
            ["-UIPreferredContentSizeCategoryName", "UICTContentSizeCategoryXL"],
        "Text size XXL":
            ["-UIPreferredContentSizeCategoryName", "UICTContentSizeCategoryXXL"],
        "Text size XXXL":
            ["-UIPreferredContentSizeCategoryName", "UICTContentSizeCategoryXXXL"],
        "Text size accessibility M":
            ["-UIPreferredContentSizeCategoryName", "UICTContentSizeCategoryAccessibilityM"],
        "Text size accessibility L":
            ["-UIPreferredContentSizeCategoryName", "UICTContentSizeCategoryAccessibilityL"],
        "Text size accessibility XL":
            ["-UIPreferredContentSizeCategoryName", "UICTContentSizeCategoryAccessibilityXL"],
        "Text size accessibility XXL":
            ["-UIPreferredContentSizeCategoryName", "UICTContentSizeCategoryAccessibilityXXL"],
        "Text size accessibility XXXL":
            ["-UIPreferredContentSizeCategoryName", "UICTContentSizeCategoryAccessibilityXXXL"],
    ]

    func activityFullAppTest(named: String, launchArguments: [String]) {
        XCTContext.runActivity(named: named) { activity in
            let app = XCUIApplication()
            app.launchArguments = launchArguments
            app.launch()

            activity.add(performUILint(app: app))
            XCTAssertUILintClean()

            XCUIApplication().tabBars["Tab Bar"].buttons["Next"].tap()
            activity.add(performUILint(app: app))
            XCTAssertUILintClean()
        }
    }

    func activityFirstTabTest(named: String, launchArguments: [String]) {
        XCTContext.runActivity(named: named) { activity in
            let app = XCUIApplication()
            app.launchArguments = launchArguments
            app.launch()

            activity.add(performUILint(app: app))
            XCTAssertUILintClean()
        }
    }

    func testTextSizesFirstTab() throws {
        for (name, arguments) in textSizes {
            activityFirstTabTest(named: name, launchArguments: arguments)
        }
    }

    func testTextSizesFullApp() throws {
        for (name, arguments) in textSizes {
            activityFullAppTest(named: name, launchArguments: arguments)
        }
    }

}
