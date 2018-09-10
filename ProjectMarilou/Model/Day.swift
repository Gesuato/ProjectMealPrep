//
//  Day.swift
//  ProjectMarilou
//
//  Created by Victor Gesuato on 2018-08-01.
//  Copyright © 2018 com.gesuatoApp. All rights reserved.
//

import UIKit

class Day: NSObject,NSCoding {
    var id:Int!
    var name:String!
    var meals:[MealClass] = []
    
    override init() {
        var titlesOfMeals:[String] = ["Breakfast","Snack1","Lunch","Snack2","Dinner","Snack3"]
        for i in 0 ... 5 {
            let meal = MealClass()
            meal.id = i
            meal.title = titlesOfMeals[i]
            meal.isChecked = false
            meals.append(meal)
        }
    }
    
    init(id:Int,name:String,meals:[MealClass]) {
        self.id = id
        self.name = name
        self.meals = meals
    }
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "dayId")
        aCoder.encode(name, forKey: "dayName")
        aCoder.encode(meals, forKey: "dayMeals")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let id = aDecoder.decodeObject(forKey:"dayId") as! Int
        let name = aDecoder.decodeObject(forKey:"dayName") as! String
        let meals = aDecoder.decodeObject(forKey:"dayMeals") as! [MealClass]
        
        self.init(id:id,name:name,meals:meals)
    }
}
