//
//  ModifyQuantityTableViewCell.swift
//  ProjectMarilou
//
//  Created by Victor Gesuato on 2018-08-02.
//  Copyright © 2018 com.gesuatoApp. All rights reserved.
//

import UIKit

class ModifyQuantityTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageNutriment: UIImageView!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var listTextField: UITextField!
    @IBOutlet weak var stepperQuantity: UIStepper!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
