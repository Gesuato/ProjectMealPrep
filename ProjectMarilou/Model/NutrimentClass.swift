//
//  NutrimentClass.swift
//  ProjectMarilou
//
//  Created by Victor Gesuato on 2018-08-01.
//  Copyright © 2018 com.gesuatoApp. All rights reserved.
//

import UIKit

class NutrimentClass:NSObject, NSCoding {
    
    var id:Int!
    var title:String!
    var quantity:Double!
    var infos:String!

    override init() {
        
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "nutrimentId")
        aCoder.encode(title, forKey: "nutrimentTitle")
        aCoder.encode(quantity, forKey: "nutrimentQuantity")
        aCoder.encode(infos, forKey: "nutrimentInfos")
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let id = aDecoder.decodeObject(forKey:"nutrimentId") as! Int
        let title = aDecoder.decodeObject(forKey:"nutrimentTitle") as! String
        let quantity = aDecoder.decodeObject(forKey:"nutrimentQuantity") as! Double
        let infos = aDecoder.decodeObject(forKey:"nutrimentInfos") as! String
        
        self.init(id:id,title:title,quantity:quantity,infos:infos)
    }
    
     init(id:Int,title:String,quantity:Double,infos:String) {
        self.id = id
        self.title = title
        self.quantity = quantity
        self.infos = infos
    }
}


