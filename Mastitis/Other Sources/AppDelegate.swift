//
//  AppDelegate.swift
//  Mastitis
//
//  Created by Monica Ong on 7/28/16.
//  Copyright © 2016 CS-ECE. All rights reserved.
//

import UIKit

struct colorPalette{
    static var red = UIColor(red: 0.98, green: 0.28, blue: 0.26, alpha: 1.0)
    static var green = UIColor(red: 0.30, green: 0.85, blue: 0.39, alpha: 1.0)
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        //Set up Tab Bar & Navigation Controllers
        let cellCounterTab = CellCounterViewController()
        let costCalculatorTab = CostCalculatorViewController()
        let cowDataTab = CowDataViewController()
        
        let cellCounterNavController = UINavigationController(rootViewController: cellCounterTab)
        let costCalculatorNavController = UINavigationController(rootViewController: costCalculatorTab)
        let cowDataNavController = UINavigationController(rootViewController: cowDataTab)
        //        navController.navigationBarHidden = true
        
        let cellCounterIcon = UITabBarItem(title: "Cell Counter", image: UIImage(named: "Cell Counter"), selectedImage: UIImage(named: "Cell Counter (Selected)"))
        let costCalculatorIcon = UITabBarItem(title: "Cost Calculator", image: UIImage(named: "Cost Calculator"), selectedImage: UIImage(named: "Cost Calculator (Selected)"))
        let cowDataIcon = UITabBarItem(title: "Cow Data", image: UIImage(named: "Cow Data"), selectedImage: UIImage(named: "Cow Data (Selected)"))
        
        cellCounterNavController.tabBarItem = cellCounterIcon
        costCalculatorNavController.tabBarItem = costCalculatorIcon
        cowDataNavController.tabBarItem = cowDataIcon
        
        cellCounterNavController.navigationBar.topItem?.title = "Cell Counter"
        costCalculatorNavController.navigationBar.topItem?.title = "Cost Calculator"
        cowDataNavController.navigationBar.topItem?.title = "Cow Data"
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [cellCounterNavController, costCalculatorNavController, cowDataNavController]
        tabBarController.selectedViewController = cowDataNavController //Make sure cowData is selected first
        tabBarController.tabBar.tintColor = colorPalette.red //Custom red color
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

