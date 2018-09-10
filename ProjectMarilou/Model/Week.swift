//
//  Week.swift
//  ProjectMarilou
//
//  Created by Victor Gesuato on 2018-08-01.
//  Copyright © 2018 com.gesuatoApp. All rights reserved.
//

import UIKit

class Week: NSObject ,NSCoding {
    
    var days:[Day] = []
    
    override init() {
        var names:[String] = ["Monday","Tuesday", "Wednesday","Thursday","Friday","Saturday","Sunday"]
        for i in 0 ... 6 {
            let day = Day()
            day.id = i
            day.name = names[i]
            days.append(day)
        }
    }
    
    init(days:[Day]) {
        self.days = days
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(days, forKey: "days")
    }

    required convenience init?(coder aDecoder: NSCoder) {
        let days = aDecoder.decodeObject(forKey:"days") as! [Day]

        self.init(days: days)
    }
}
