//
//  DayOfTheWeekClass.swift
//  ProjectMarilou
//
//  Created by Victor Gesuato on 2018-08-01.
//  Copyright © 2018 com.gesuatoApp. All rights reserved.
//

import UIKit

class Day: NSObject {
    var title:String?
    var meals:[MealClass] = []
    
    override init() {
        var titlesOfMeals:[String] = ["Dejèneur","Colation","Diner","Colation","Souper","Colation"]
        for i in 0 ... 5 {
            let meal = MealClass()
            meal.title = titlesOfMeals[i]
            meals.append(meal)
        }
    }
    
}
