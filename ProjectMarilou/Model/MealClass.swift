//
//  MealClass.swift
//  ProjectMarilou
//
//  Created by Victor Gesuato on 2018-08-01.
//  Copyright © 2018 com.gesuatoApp. All rights reserved.
//

import UIKit


class MealClass:NSObject, NSCoding {
    
    var id:Int!
    var title:String!
    var nutriments:[NutrimentClass] = []
    var isChecked:Bool!
    
    override init() {

        for i in 0 ... 6 {
            var titlesOfNutriment:[String] = ["Veggies","Fruits","Proteins","Carbohydrates","Healthy Fats","Seeds & Dressings","Oils & Nut Butters"]
            let nutriment = NutrimentClass()
            nutriment.id = i
            nutriment.title = titlesOfNutriment[i]
            nutriment.quantity = 0.0
            nutriment.infos = ""
            nutriments.append(nutriment)
        }
    }
    
    init(id:Int,title:String,nutriments:[NutrimentClass],isChecked:Bool) {
        self.id = id
        self.title = title
        self.nutriments = nutriments
        self.isChecked = isChecked
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "mealId")
        aCoder.encode(title, forKey: "mealTitle")
        aCoder.encode(nutriments, forKey: "nutrimentsMeal")
        aCoder.encode(isChecked, forKey: "isChecked")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let id = aDecoder.decodeObject(forKey:"mealId") as! Int
        let title = aDecoder.decodeObject(forKey:"mealTitle") as! String
        let nutriments = aDecoder.decodeObject(forKey:"nutrimentsMeal") as! [NutrimentClass]
        let isChecked = aDecoder.decodeObject(forKey:"isChecked") as! Bool
        
        self.init(id:id,title:title,nutriments:nutriments,isChecked:isChecked)
    }
}
