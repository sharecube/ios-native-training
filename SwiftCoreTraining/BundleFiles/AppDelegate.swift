//
//  AppDelegate.swift
//  SwiftCoreTraining
//
//  Created by Dmytro Geienko on 1/26/19.
//  Copyright © 2019 chrisik. All rights reserved.
//

import UIKit
import CoreData
import Rswift

typealias VoidClosure = () -> ()
typealias Localizable = R.string.localizable

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let navVC = UINavigationController(rootViewController: DebugVC())
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        CoreDataManager.shared.saveContext(completion: { _ in})
    }
    
}

