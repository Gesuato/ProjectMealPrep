//
//  WeekRemainingPortionsClass.swift
//  ProjectMarilou
//
//  Created by Victor Gesuato on 2018-08-02.
//  Copyright © 2018 com.gesuatoApp. All rights reserved.
//

import UIKit


class WeekRemainingPortionsClass: NSObject , NSCoding {
    
    var weekRemainingPortions:[RemainingPortionsClass] = []


    override init() {
        for i in 0 ... 6 {
            let remainingPortions = RemainingPortionsClass()
            remainingPortions.id = i
            weekRemainingPortions.append(remainingPortions)
        }
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(weekRemainingPortions, forKey: "weekRemainingPortions")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let weekRemainingPortions = aDecoder.decodeObject(forKey:"weekRemainingPortions") as! [RemainingPortionsClass]
        
        self.init(weekRemainingPortions:weekRemainingPortions)
    }
    
    init(weekRemainingPortions:[RemainingPortionsClass]) {
        self.weekRemainingPortions = weekRemainingPortions
    }
}



