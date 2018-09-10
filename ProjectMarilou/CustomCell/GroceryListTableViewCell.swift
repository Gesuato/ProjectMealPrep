//
//  GroceryListTableViewCell.swift
//  ProjectMarilou
//
//  Created by Victor Gesuato on 2018-08-03.
//  Copyright © 2018 com.gesuatoApp. All rights reserved.
//

import UIKit

class GroceryListTableViewCell: UITableViewCell {

    @IBOutlet weak var checked: UIButton!
    @IBOutlet weak var nutrimentInfo: UILabel!
    @IBOutlet weak var portions: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
