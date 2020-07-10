//
//  ViewController.swift
//  UIKItAgilityCourse
//
//  Created by Quinn McHenry on 7/9/20.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let firstVC = FirstViewController()
        firstVC.tabBarItem = UITabBarItem(title: "Zeroth", image: UIImage(systemName: "backward.end"), tag: 0)
        let secondVC = SecondViewController()
        secondVC.tabBarItem = UITabBarItem(title: "Next", image: UIImage(systemName: "goforward.plus"), tag: 1)

        viewControllers = [firstVC, secondVC]

    }


}

