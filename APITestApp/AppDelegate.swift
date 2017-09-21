//
//  AppDelegate.swift
//  APITestApp
//
//  Created by Admin on 21/09/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var viewSpinner:UIView!
    var activityIndicator:UIActivityIndicatorView!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    //MARK: show spinner and stop spinner view
    func showSpinnerView(_view:UIView)
    {
        viewSpinner=UIView()
        viewSpinner?.frame=CGRect(x:Constant.GlobalConstants.screenWidth/2-35, y:Constant.GlobalConstants.screenHeight/2-35, width: 70, height: 70)
        viewSpinner?.backgroundColor=UIColor(red: 24.0/255.0, green: 55/255.0, blue: 127/255.0, alpha: 1.0)
        viewSpinner?.layer.borderColor=UIColor.white.cgColor
        viewSpinner?.layer.borderWidth=1
        viewSpinner?.layer.cornerRadius=5
        _view .addSubview(viewSpinner!)
        
        activityIndicator=UIActivityIndicatorView()
        activityIndicator?.frame = CGRect(x: (viewSpinner?.frame.size.width)!/2-15, y: (viewSpinner?.frame.size.width)!/2-15, width: 30, height: 30)
        activityIndicator?.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        activityIndicator?.startAnimating()
        viewSpinner?.addSubview(activityIndicator!)
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    func stopSpinner()
    {
        viewSpinner?.removeFromSuperview()
        activityIndicator?.removeFromSuperview()
        UIApplication.shared.endIgnoringInteractionEvents()
    }
}

