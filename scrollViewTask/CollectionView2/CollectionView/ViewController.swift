//
//  ViewController.swift
//  CollectionView
//
//  Created by Sierra 4 on 08/02/17.
//  Copyright © 2017 code-brew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableTableView: UITableView!
        
    
    var choice = Int()
    let countItems = 5
    var itemTypes = ["Wheat", "Rice", "Sauce", "Chcolate", "Milk"]
    // item data for wheat---------------------------------------------------
    var WheatProductName = ["Ashirvaaad Whole wheat atta", "Ashirvaad multigrain atta", "ashirvaad whole wheat atta", "Ashirvaad superior atta", "ashirvaad kings grade atta"]
    var WheatProductDiscount = [5,5,5,5,5]
    var WheatProductWeight = 5
    var WheatProductPrice = [360, 245, 185, 380, 500]
    //------------------------------------------------------------------------
    // item data for rice-----------------------------------------------------
    var RiceProductName = ["India gate Shahi Biryani Rice", "India Gate Regular Rice", "India Gate Dubar Basmati Rice", "India Gate Feast Rozzana Basmati", "India Gate Shahi Basmati Rice"]
    var RiceProductDiscount = [5,5,5,5,5]
    var RiceProductWeight = 5
    var RiceProductPrice = [600, 700, 84, 600, 1000]
    //------------------------------------------------------------------------
    // item data for sauce-----------------------------------------------------
    var SauceProductName = ["tomato sauce", "mustard sauce", "soya sauce", "Brown Sauce", "butter sauce"]
    var SauceProductDiscount = [5,5,5,5,5]
    var SauceProductWeight = 200
    var SauceProductPrice = [600, 700, 84, 600, 1000]
    //------------------------------------------------------------------------
    // item data for sauce-----------------------------------------------------
    var ChocolateProductName = ["simple dairy milk", "fruit n nut", "Bournville", "Dairy Milk Whole Nut", "Dairy Milk Caramel"]
    var ChocolateProductDiscount = [5,5,5,5,5]
    var ChocolateProductWeight = 200
    var ChocolateProductPrice = [6, 7, 840, 60, 10]
    //------------------------------------------------------------------------
    // item data for sauce-----------------------------------------------------
    var MilkProductName = ["full cream", "double toned", "single toned", "soya milk", "whipped cream milk"]
    var MilkProductDiscount = [5,5,5,5,5]
    var MilkProductWeight = 500
    var MilkProductPrice = [60, 17, 84, 600, 1000]
    //------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
//UICollectionViewDataSource, UICollectionViewDelegate,
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemTypes.count
    }
    //for section names
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellForSectionNames = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! OptionScrollCollectionViewCell
        cellForSectionNames.btnSectionName.setTitle( "\(itemTypes[indexPath.row])" , for: .normal )
        cellForSectionNames.tag = Int(indexPath.row)
        return cellForSectionNames
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        choice = indexPath.row
        print(choice)
        self.tableTableView.reloadData()
        
        
    }
}
//per section the table for the items
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countItems
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "sectionItemCell", for: indexPath) as? SectionItemsTableViewCell else{
            fatalError()
        }
        
        
        if choice == 0 {
            //self.tableTableView.reloadData()
            cell.lblProductName.text = WheatProductName[indexPath.row]
            cell.lblProductDiscount.text = "\(WheatProductDiscount[indexPath.row])% Discount"
            cell.lblProductWeight.text = "\(WheatProductWeight)Kg"
            cell.lblProductPrice.text = "Rs.\(WheatProductPrice[indexPath.row])"
        }
        else if choice == 1 {
            //self.tableTableView.reloadData()
            cell.lblProductName.text = RiceProductName[indexPath.row]
            cell.lblProductDiscount.text = "\(RiceProductDiscount[indexPath.row])% Discount"
            cell.lblProductWeight.text = "\(RiceProductWeight)Kg"
            cell.lblProductPrice.text = "Rs.\(RiceProductPrice[indexPath.row])"
        }
        else if choice == 2 {
            //self.tableTableView.reloadData()
            cell.lblProductName.text = SauceProductName[indexPath.row]
            cell.lblProductDiscount.text = "\(SauceProductDiscount[indexPath.row])% Discount"
            cell.lblProductWeight.text = "\(SauceProductWeight)ml"
            cell.lblProductPrice.text = "Rs.\(SauceProductPrice[indexPath.row])"
        }
        else if choice == 3 {
            //self.tableTableView.reloadData()
            cell.lblProductName.text = ChocolateProductName[indexPath.row]
            cell.lblProductDiscount.text = "\(ChocolateProductDiscount[indexPath.row])% Discount"
            cell.lblProductWeight.text = "\(ChocolateProductWeight)g"
            cell.lblProductPrice.text = "Rs.\(ChocolateProductPrice[indexPath.row])"
        }
        else if choice == 4 {
            //self.tableTableView.reloadData()
            cell.lblProductName.text = MilkProductName[indexPath.row]
            cell.lblProductDiscount.text = "\(MilkProductDiscount[indexPath.row])% Discount"
            cell.lblProductWeight.text = "\(MilkProductWeight)ml"
            cell.lblProductPrice.text = "Rs.\(MilkProductPrice[indexPath.row])"
        }

        return cell
    }
}



