//
//  ModifyRemainingPortionsViewController.swift
//  ProjectMarilou
//
//  Created by Victor Gesuato on 2018-08-02.
//  Copyright © 2018 com.gesuatoApp. All rights reserved.
//

import UIKit

class ModifyRemainingPortionsViewController: UIViewController {
    var image:UIImage?
    var portionSelected = NutrimentClass()
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var stepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = portionSelected.title!
        self.imageView.image = image
        self.quantityLabel.text = String(self.portionSelected.quantity!)
        self.stepper.value = self.portionSelected.quantity!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    @IBAction func stepperTapped(_ sender: Any) {
        self.quantityLabel.text = String(self.stepper.value)
    }
    
    @IBAction func btnSaveTapped(_ sender: Any) {
        self.portionSelected.quantity = self.stepper.value
        self.appDelegate.saveWeekRemainingPortions(week: self.appDelegate.weekRemainingPortions)
        dismiss(animated: true, completion: nil)
    }
    @IBAction func btnCancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
