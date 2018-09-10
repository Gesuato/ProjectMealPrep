//
//  ViewController.swift
//  ProjectMarilou
//
//  Created by Victor Gesuato on 2018-07-31.
//  Copyright © 2018 com.gesuatoApp. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {


    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControlWeek: UISegmentedControl!
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    var userDefaults = UserDefaults.standard
    var currentMeaViewController:Int!
    var portionSelected = NutrimentClass ()
    var imagePortionSelected:UIImage?
    
    @IBOutlet weak var portionVegetablesButton: UIButton!
    @IBOutlet weak var portionFruitsButton: UIButton!
    @IBOutlet weak var portionProteinsButton: UIButton!
    @IBOutlet weak var portionCarbohydrateButton: UIButton!
    @IBOutlet weak var portionGoodFatButton: UIButton!
    @IBOutlet weak var portionSeedsButton: UIButton!
    @IBOutlet weak var portionOilsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.segmentedControlWeek.selectedSegmentIndex = self.appDelegate.currentSegmentControl
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        setValuesInPortion()
        
        self.navigationItem.title = self.appDelegate.currentDay.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setValuesInPortion()
        tableView.reloadData()
    
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105.0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        // label
        cell.labelTitle.text = self.appDelegate.currentDay.meals[indexPath.row].title
        
        if self.appDelegate.currentDay.meals[indexPath.row].nutriments[0].quantity! != 0.0{
         cell.labelVegetables.text = String(self.appDelegate.currentDay.meals[indexPath.row].nutriments[0].quantity!)
        }else{
         cell.labelVegetables.text = ""
        }
        if self.appDelegate.currentDay.meals[indexPath.row].nutriments[1].quantity! != 0.0{
            cell.labelFruits.text = String(self.appDelegate.currentDay.meals[indexPath.row].nutriments[1].quantity!)
        }else{
            cell.labelFruits.text = ""
        }
        if self.appDelegate.currentDay.meals[indexPath.row].nutriments[2].quantity! != 0.0{
            cell.labelProtein.text = String(self.appDelegate.currentDay.meals[indexPath.row].nutriments[2].quantity!)
        }else{
            cell.labelProtein.text = ""
        }
        if self.appDelegate.currentDay.meals[indexPath.row].nutriments[3].quantity! != 0.0{
            cell.labelCarbohydrates.text = String(self.appDelegate.currentDay.meals[indexPath.row].nutriments[3].quantity!)
        }else{
            cell.labelCarbohydrates.text = ""
        }
        if self.appDelegate.currentDay.meals[indexPath.row].nutriments[4].quantity! != 0.0{
            cell.labelGoodFat.text = String(self.appDelegate.currentDay.meals[indexPath.row].nutriments[4].quantity!)
        }else{
            cell.labelGoodFat.text = ""
        }
        if self.appDelegate.currentDay.meals[indexPath.row].nutriments[5].quantity! != 0.0{
            cell.labelSeeds.text = String(self.appDelegate.currentDay.meals[indexPath.row].nutriments[5].quantity!)
        }else{
            cell.labelSeeds.text = ""
        }
        if self.appDelegate.currentDay.meals[indexPath.row].nutriments[6].quantity! != 0.0{
            cell.labelOils.text = String(self.appDelegate.currentDay.meals[indexPath.row].nutriments[6].quantity!)
        }else{
            cell.labelOils.text = ""
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.currentMeaViewController = indexPath.row
        performSegue(withIdentifier: "KMofifyValuesMeal", sender: self)
    }
    
    
    @IBAction func segmentedControlTapped(_ sender: Any) {
        self.appDelegate.currentDay = self.appDelegate.week.days[self.segmentedControlWeek.selectedSegmentIndex]
        userDefaults.set(self.segmentedControlWeek.selectedSegmentIndex, forKey: "segmented")
        setValuesInPortion()
        self.navigationItem.title = self.appDelegate.currentDay.name
        self.tableView.reloadData()
    }
    @IBAction func portionVegetablesButtonTapped(_ sender: Any) {
        self.portionSelected = self.appDelegate.currentRamainingPortions.ramainingPortions[0]
        self.imagePortionSelected = self.portionVegetablesButton.currentBackgroundImage
        performSegue(withIdentifier: "KRamainingPortions", sender: self)
    }
    @IBAction func portionFruitsButtonTapped(_ sender: Any) {
        self.portionSelected = self.appDelegate.currentRamainingPortions.ramainingPortions[1]
        self.imagePortionSelected = self.portionFruitsButton.currentBackgroundImage
        performSegue(withIdentifier: "KRamainingPortions", sender: self)
    }
    @IBAction func portionProteinsButtonTapped(_ sender: Any) {
        self.portionSelected = self.appDelegate.currentRamainingPortions.ramainingPortions[2]
        self.imagePortionSelected = self.portionProteinsButton.currentBackgroundImage
        performSegue(withIdentifier: "KRamainingPortions", sender: self)
    }
    @IBAction func portionCarbohydrateButtonTapped(_ sender: Any) {
        self.portionSelected = self.appDelegate.currentRamainingPortions.ramainingPortions[3]
        self.imagePortionSelected = self.portionCarbohydrateButton.currentBackgroundImage
        performSegue(withIdentifier: "KRamainingPortions", sender: self)
    }
    @IBAction func portionGoodFatButtonTapped(_ sender: Any) {
        self.portionSelected = self.appDelegate.currentRamainingPortions.ramainingPortions[4]
        self.imagePortionSelected = self.portionGoodFatButton.currentBackgroundImage
        performSegue(withIdentifier: "KRamainingPortions", sender: self)
    }
    @IBAction func portionSeedsButtonTapped(_ sender: Any) {
        self.portionSelected = self.appDelegate.currentRamainingPortions.ramainingPortions[5]
        self.imagePortionSelected = self.portionSeedsButton.currentBackgroundImage
        performSegue(withIdentifier: "KRamainingPortions", sender: self)
    }
    @IBAction func portionOilsButtonTapped(_ sender: Any) {
        self.portionSelected = self.appDelegate.currentRamainingPortions.ramainingPortions[6]
        self.imagePortionSelected = self.portionOilsButton.currentBackgroundImage
        performSegue(withIdentifier: "KRamainingPortions", sender: self)
    }
    
    func setValuesInPortion(){
        self.appDelegate.currentRamainingPortions = self.appDelegate.weekRemainingPortions.weekRemainingPortions[segmentedControlWeek.selectedSegmentIndex]
        self.portionVegetablesButton.setTitle(String(self.appDelegate.currentRamainingPortions.ramainingPortions[0].quantity!), for: .normal)
        self.portionFruitsButton.setTitle(String(self.appDelegate.currentRamainingPortions.ramainingPortions[1].quantity!), for: .normal)
        self.portionProteinsButton.setTitle(String(self.appDelegate.currentRamainingPortions.ramainingPortions[2].quantity!), for: .normal)
        self.portionCarbohydrateButton.setTitle(String(self.appDelegate.currentRamainingPortions.ramainingPortions[3].quantity!), for: .normal)
        self.portionGoodFatButton.setTitle(String(self.appDelegate.currentRamainingPortions.ramainingPortions[4].quantity!), for: .normal)
        self.portionSeedsButton.setTitle(String(self.appDelegate.currentRamainingPortions.ramainingPortions[5].quantity!), for: .normal)
        self.portionOilsButton.setTitle(String(self.appDelegate.currentRamainingPortions.ramainingPortions[6].quantity!), for: .normal)
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "KMofifyValuesMeal"{
            let nav = segue.destination as! UINavigationController
            let rootView = nav.viewControllers.first as! ModifyQuantityNutrimentTableViewController
            rootView.currentMeal = self.currentMeaViewController
        }else if segue.identifier == "KRamainingPortions"{
            let nav = segue.destination as! UINavigationController
            let rootView = nav.viewControllers.first as! ModifyRemainingPortionsViewController
            rootView.image = self.imagePortionSelected
            rootView.portionSelected = self.portionSelected
        }
    }
    
}


