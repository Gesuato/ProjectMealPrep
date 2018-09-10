//
//  RemainingPortionsClass.swift
//  ProjectMarilou
//
//  Created by Victor Gesuato on 2018-08-02.
//  Copyright © 2018 com.gesuatoApp. All rights reserved.
//

import UIKit

class RemainingPortionsClass: NSObject , NSCoding {
    var id:Int!
    var ramainingPortions:[NutrimentClass] = []

    override init() {
        var valuesNutriment:[Double] = [3,2,4,2,1,1,2]
        var titlesForNutriment:[String] = ["Veggies","Fruits","Proteins","Carbohydrates","Healthy Fats","Seeds & Dressings","Oils & Nut Butters"]
        
        for i in 0 ... 6 {
            let nutriment = NutrimentClass()
            nutriment.id = i
            nutriment.title = titlesForNutriment[i]
            nutriment.quantity = valuesNutriment[i]
            nutriment.infos = ""
            ramainingPortions.append(nutriment)
        }
    }
    
    init(id:Int,ramainingPortions:[NutrimentClass]) {
        self.id = id
        self.ramainingPortions = ramainingPortions
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "remainingId")
        aCoder.encode(ramainingPortions, forKey: "remainingPortions")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let id = aDecoder.decodeObject(forKey:"remainingId") as! Int
        let ramainingPortions = aDecoder.decodeObject(forKey:"remainingPortions") as! [NutrimentClass]
        
        self.init(id:id,ramainingPortions:ramainingPortions)
    }
}

