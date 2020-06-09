//
//  SceneDelegate.swift
//  LintyUIKitDemo
//
//  Created by Quinn McHenry on 5/22/20.
//  Copyright © 2020 Quinn McHenry. All rights reserved.
//

import UIKit
import UILint

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        UILint.register(window: window)

        UILintConfig.shared.expectedFontNames = [".SFUI-Regular", "Futura-Medium", "Futura-Bold", "Futura-MediumItalic" ]
//        UILintConfig.shared.excludedChecks = [LabelUnexpectedFont.self]
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
        UILint.deregister()
    }

}

