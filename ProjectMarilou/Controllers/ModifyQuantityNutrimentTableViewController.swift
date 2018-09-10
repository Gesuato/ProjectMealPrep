//
//  ModifyQuantityNutrimentTableViewController.swift
//  ProjectMarilou
//
//  Created by Victor Gesuato on 2018-08-02.
//  Copyright © 2018 com.gesuatoApp. All rights reserved.
//

import UIKit

class ModifyQuantityNutrimentTableViewController: UITableViewController {

    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    var currentMeal:Int!
    var arrayImages:[UIImage] = [#imageLiteral(resourceName: "circuloVerde"),#imageLiteral(resourceName: "circuloRocho"),#imageLiteral(resourceName: "circuloVermelho"),#imageLiteral(resourceName: "circuloAmarelo"),#imageLiteral(resourceName: "circuloAzul"),#imageLiteral(resourceName: "circuloLaranja"),#imageLiteral(resourceName: "circuloCinza")]
    var valuesStepper:[Double] = [0,0,0,0,0,0,0]
    var valuesTextField:[String] = ["","","","","","",""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.appDelegate.currentDay.meals[currentMeal].title!
        self.tableView.register(UINib(nibName: "ModifyQuantityTableViewCell", bundle: nil), forCellReuseIdentifier: "CellModify")
        
        for (key,value) in self.appDelegate.currentDay.meals[currentMeal].nutriments.enumerated(){
            valuesStepper[key] = value.quantity!
            valuesTextField[key] = value.infos ?? ""
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    // MARK: - Table view data source

    @IBAction func btnCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
   override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
    
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.appDelegate.currentDay.meals[currentMeal].nutriments.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellModify", for: indexPath) as! ModifyQuantityTableViewCell
        cell.imageNutriment.image = arrayImages[indexPath.row]
        cell.titleLabel.text = self.appDelegate.currentDay.meals[currentMeal].nutriments[indexPath.row].title!
        cell.quantityLabel.text = String(valuesStepper[indexPath.row])
        cell.stepperQuantity.tag = indexPath.row
        cell.stepperQuantity.value = self.valuesStepper[indexPath.row]
        cell.stepperQuantity.addTarget(self, action: #selector(stepperTapped), for: .touchUpInside)
        cell.listTextField.tag = indexPath.row
        cell.listTextField.placeholder = "Description of the " + self.appDelegate.currentDay.meals[currentMeal].nutriments[indexPath.row].title!.lowercased()
        cell.listTextField.addTarget(self, action: #selector(textFieldTapped), for: .editingDidEndOnExit)
        if valuesTextField[indexPath.row] != ""{
            cell.listTextField.text = valuesTextField[indexPath.row]
        }
        
        return cell
    }
    
    @objc func stepperTapped(sender:UIStepper){
        self.valuesStepper[sender.tag] = sender.value
        self.tableView.reloadData()
    }
    
    @objc func textFieldTapped(sender:UITextField){
        self.valuesTextField[sender.tag] = sender.text!
        self.tableView.reloadData()
    }
    
    @IBAction func btnSaveTapped(_ sender: Any) {
        for (key,value) in self.appDelegate.currentRamainingPortions.ramainingPortions.enumerated(){
            value.quantity = value.quantity + self.appDelegate.currentDay.meals[currentMeal].nutriments[key].quantity
        }
        for (key,value) in self.valuesStepper.enumerated(){
            self.appDelegate.currentDay.meals[currentMeal].nutriments[key].quantity = value
            self.appDelegate.currentRamainingPortions.ramainingPortions[key].quantity = self.appDelegate.currentRamainingPortions.ramainingPortions[key].quantity - value
        }
        for (key,value) in self.valuesTextField.enumerated(){
            self.appDelegate.currentDay.meals[currentMeal].nutriments[key].infos = value
        }
        
        self.appDelegate.saveWeek(week: self.appDelegate.week)
        self.appDelegate.saveWeekRemainingPortions(week: self.appDelegate.weekRemainingPortions)
        
        dismiss(animated: true, completion: nil)
    }
    
}
