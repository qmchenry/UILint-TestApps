//
//  SecondViewController.swift
//  UIKItAgilityCourse
//
//  Created by Quinn McHenry on 7/9/20.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        let label = UILabel()
        label.text = " Goodbye    world ! ! ! !"
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)

        let label2 = UILabel()
        label2.text = "cruel"
        label2.transform = CGAffineTransform(rotationAngle: 1.57)
        label2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label2)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label2.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

}
