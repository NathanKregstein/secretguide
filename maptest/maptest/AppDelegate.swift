//
//  AppDelegate.swift
//  maptest
//
//  Created by Nathan Kregstein on 12/2/19.
//  Copyright © 2019 Nathan Kregstein. All rights reserved.
//

import UIKit
import GoogleMaps
import FirebaseCore
import FirebaseFirestore
//import FirebaseFirestoreSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var db: Firestore!
    var roomNumber = 0
    var player1 = true
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        GMSServices.provideAPIKey("AIzaSyC4homFwOhpH_MAEtCVq7OLkEyjdOKsWwc")
        
        FirebaseApp.configure()
        
        db = Firestore.firestore()
        print(db)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        db.collection("rooms").document("room" + String(roomNumber) ).updateData( ["player2In": false
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
        db.collection("rooms").document("room" + String(roomNumber) ).updateData( ["player1In": false
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
        db.collection("rooms").document("room" + String(roomNumber)).collection("hints").document("player2Hints").delete()
        db.collection("rooms").document("room" + String(roomNumber)).collection("hints").document("player1Hints").delete()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        db.collection("rooms").document("room" + String(roomNumber) ).updateData( ["player2In": false
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
        db.collection("rooms").document("room" + String(roomNumber)).collection("hints").document("player2Hints").delete()
        db.collection("rooms").document("room" + String(roomNumber)).collection("hints").document("player1Hints").delete()
    }


}

