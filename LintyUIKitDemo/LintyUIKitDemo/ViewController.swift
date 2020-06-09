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
        if let lint = UILint(view: view) {
            let pdfData = lint.makePDF()
            try? pdfData.write(to: URL(fileURLWithPath: "/tmp/test.pdf"))
        }
    }

}
