//
//  AppDelegate.swift
//  ProjectMarilou
//
//  Created by Victor Gesuato on 2018-07-31.
//  Copyright © 2018 com.gesuatoApp. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var week = Week()
    var currentDay = Day()
    var weekRemainingPortions = WeekRemainingPortionsClass()
    var currentRamainingPortions = RemainingPortionsClass()
    var currentSegmentControl:Int = 0

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        loadWeekInUserDefaults()
        loadWeekRemainingPortionsInUserDefaults()
        getCurrentSegmentControl()
        currentDay = week.days[currentSegmentControl]
        currentRamainingPortions = weekRemainingPortions.weekRemainingPortions[currentSegmentControl]
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ProjectMarilou")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func getCurrentSegmentControl(){
        let defaults = UserDefaults.standard
        if defaults.object(forKey: "segmented") != nil {
            self.currentSegmentControl = defaults.integer(forKey: "segmented")
        }
    }
    
    func saveWeek(week:Week){

        let weekData = NSKeyedArchiver.archivedData(withRootObject: self.week)
        UserDefaults.standard.set(weekData, forKey: "kWeek")
    }
    func loadWeekInUserDefaults(){
        if UserDefaults.standard.object(forKey: "kWeek") != nil {
            let weekData = UserDefaults.standard.object(forKey: "kWeek") as? NSData
            
            self.week = (NSKeyedUnarchiver.unarchiveObject(with: weekData! as Data) as? Week)!
        }
    }
    
    func saveWeekRemainingPortions(week:WeekRemainingPortionsClass){
        
        let weekData = NSKeyedArchiver.archivedData(withRootObject: self.weekRemainingPortions)
        UserDefaults.standard.set(weekData, forKey: "kWeekRemainingPortions")
    }
    
    func loadWeekRemainingPortionsInUserDefaults(){
        if UserDefaults.standard.object(forKey: "kWeekRemainingPortions") != nil {
            let weekData = UserDefaults.standard.object(forKey: "kWeekRemainingPortions") as? NSData
            
            self.weekRemainingPortions = (NSKeyedUnarchiver.unarchiveObject(with: weekData! as Data) as? WeekRemainingPortionsClass)!
        }
    }
}

