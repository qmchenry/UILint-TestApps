//
//  ViewController.swift
//  LintyUIKitDemo
//
//  Created by Quinn McHenry on 5/22/20.
//  Copyright © 2020 Quinn McHenry. All rights reserved.
//

import UIKit
import UILint

class ViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false, block: doUILint)
    }

    func doUILint(timer: Timer) {
        if let lint = UILint(view: view) {
            let pdfData = lint.makePDF()
            try? pdfData.write(to: URL(fileURLWithPath: "/tmp/test.pdf"))
        }
    }

}

// Example of excluding checks for specific view/check combinations or all checks for one view
extension ViewController: UILintConfigurable {

    func shouldLint(element: Element, check: Check.Type) -> Bool {
        switch (element.tag, element.accessibilityIdentifier, check) {
        // exclude all checks on single view (with tag of 10)
        case (10, _, _): return false
        // exclude SafeArea check on a single view (with accessibility id set
        case (_, "You get a B label", is SafeArea.Type): return false
        default: return true
        }
    }

}
