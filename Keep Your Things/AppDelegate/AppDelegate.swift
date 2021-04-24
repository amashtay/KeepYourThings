//
//  AppDelegate.swift
//  Keep Your Things
//
//  Created by Александр on 26.03.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = MainWireframe.createModule()
        window?.makeKeyAndVisible()
        
        return true
    }

}

