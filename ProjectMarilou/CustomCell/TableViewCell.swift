//
//  TableViewCell.swift
//  ProjectMarilou
//
//  Created by Victor Gesuato on 2018-08-02.
//  Copyright © 2018 com.gesuatoApp. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelVegetables: UILabel!
    @IBOutlet weak var labelFruits: UILabel!
    @IBOutlet weak var labelProtein: UILabel!
    @IBOutlet weak var labelCarbohydrates: UILabel!
    @IBOutlet weak var labelGoodFat: UILabel!
    @IBOutlet weak var labelSeeds: UILabel!
    @IBOutlet weak var labelOils: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
