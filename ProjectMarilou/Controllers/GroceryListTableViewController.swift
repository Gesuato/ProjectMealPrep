//
//  GroceryListTableViewController.swift
//  ProjectMarilou
//
//  Created by Victor Gesuato on 2018-08-03.
//  Copyright © 2018 com.gesuatoApp. All rights reserved.
//

import UIKit

class GroceryListTableViewController: UITableViewController {
    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    var groceryList:[[Item]] = [[],[],[],[],[],[],[]]
    var listItems:[[Item]] = [[],[],[],[],[],[],[]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.tableView.register(UINib(nibName: "GroceryListTableViewCell", bundle: nil), forCellReuseIdentifier: "CellGroceryList")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        formatedGroceryList()
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    // MARK: - Table view data source
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 7
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groceryList[section].count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellGroceryList", for: indexPath) as! GroceryListTableViewCell
        
        cell.nutrimentInfo.text = groceryList[indexPath.section][indexPath.row].name
        
        if groceryList[indexPath.section][indexPath.row].portion! > 1{
         cell.portions.text = ("(\(groceryList[indexPath.section][indexPath.row].portion!)) meals")
        }else{
        cell.portions.text = ("(\(groceryList[indexPath.section][indexPath.row].portion!)) meal")
        }
        cell.checked.addTarget(self, action: #selector(btnCheckTapped), for: .touchUpInside)
        if groceryList[indexPath.section][indexPath.row].isChecked{
            cell.checked.setImage(#imageLiteral(resourceName: "iconCorretoAzul"), for: .normal)
        }else{
            cell.checked.setImage(#imageLiteral(resourceName: "iconCorreto"), for: .normal)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.appDelegate.currentDay.meals[0].nutriments[section].title?.uppercased()
    }
    
    @objc func btnCheckTapped(sender:UIButton){
        let cell = sender.superview?.superview?.superview as! UITableViewCell
        let indexPath:IndexPath = self.tableView.indexPath(for: cell)!
        if groceryList[indexPath.section][indexPath.row].isChecked{
            groceryList[indexPath.section][indexPath.row].isChecked = false
        }else{
            groceryList[indexPath.section][indexPath.row].isChecked = true
        }
        self.tableView.reloadData()
    }


    func formatedGroceryList(){
        groceryList = [[],[],[],[],[],[],[]]
        var list:[[String]] = [[],[],[],[],[],[],[]]
        var stringNutriment:[String] = ["","","","","","",""]
        listItems = [[],[],[],[],[],[],[]]
   
        for day in self.appDelegate.week.days{
            for valueInMeal in day.meals{
                for valueInNutriment in valueInMeal.nutriments{
                    if valueInNutriment.infos != "" && valueInNutriment.infos != nil{
                        stringNutriment[valueInNutriment.id!].append(valueInNutriment.infos! + ",")
                    }
                }
            }
        }
        
        for i in 0...6{
            list[i] = stringNutriment[i].components(separatedBy: ",")
        }
        
        for (key,arrayString) in list.enumerated(){
            for value in arrayString{
                let item = Item()
                item.name = value
                item.portion = 1
                item.isChecked = false
                groceryList[key].append(item)
            }
        }

        
        for (key,items) in groceryList.enumerated(){
            var isValide = true
            var portion:Int = 1
            for item in items{
                for itemList in listItems[key]{
                    if item.name.lowercased() == itemList.name.lowercased(){
                      isValide = false
                      portion = portion + 1
                    }
                }
                if isValide && item.name != "" && item.name != nil{
                    listItems[key].append(item)
                }else if item.name != "" && item.name != nil && portion > 1{
                 
                    for itemPortion in items{
                        for itemListPortion in listItems[key]{
                            if itemPortion.name.lowercased() == itemListPortion.name.lowercased(){
                               itemListPortion.portion = portion
                            }
                        }
                    }
                   
                }
            }
        }
        
        groceryList = listItems

    }
}
