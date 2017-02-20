//  ViewController.swift
//  CollectionView
//
//  Created by Sierra 4 on 08/02/17.
//  Copyright © 2017 code-brew. All rights reserved.

import UIKit
import Kingfisher

class ViewController: UIViewController {
    var rowSelector = Int()
    
    
    
    @IBOutlet weak var tableTableView: UITableView!
    // object of the model class named ItemsDataStorage
    var objectItemDataStorage = ItemsDataStorage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objectItemDataStorage.itemTypes.count
    }
    //for section names
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellForSectionNames = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! OptionScrollCollectionViewCell
        cellForSectionNames.btnSectionName.setTitle( "\(objectItemDataStorage.itemTypes[indexPath.row])" , for: .normal )
        
        if (objectItemDataStorage.choice == indexPath.row)
        {
            cellForSectionNames.lblOptionSelected.backgroundColor = UIColor.green
        }
        else {
            cellForSectionNames.lblOptionSelected.backgroundColor = UIColor.white
        }
        return cellForSectionNames
    }
    // select a cell in collection
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        objectItemDataStorage.choice = indexPath.row
        collectionView.reloadData()
        //print(choice)
        self.tableTableView.reloadData()
    }
}
//per section the table for the items
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectItemDataStorage.countItems
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "sectionItemCell", for: indexPath) as? SectionItemsTableViewCell else{
            fatalError()
        }
         if objectItemDataStorage.choice == 0 {
            cell.lblProductName.text = objectItemDataStorage.WheatProductName[indexPath.row]
            cell.lblProductDiscount.text = "\(objectItemDataStorage.WheatProductDiscount[indexPath.row])% OFF"
            cell.lblProductWeight.text = "\(objectItemDataStorage.WheatProductWeight)Kg"
            cell.lblProductPrice.text = "Rs.\(objectItemDataStorage.WheatProductPrice[indexPath.row])"
            let url = URL(string: "\(objectItemDataStorage.WheatImageUrl[indexPath.row])")
            cell.imgProductImage.kf.setImage(with: url)
        }
        else if objectItemDataStorage.choice == 1 {
            cell.lblProductName.text = objectItemDataStorage.RiceProductName[indexPath.row]
            cell.lblProductDiscount.text = "\(objectItemDataStorage.RiceProductDiscount[indexPath.row])% OFF"
            cell.lblProductWeight.text = "\(objectItemDataStorage.RiceProductWeight)Kg"
            cell.lblProductPrice.text = "Rs.\(objectItemDataStorage.RiceProductPrice[indexPath.row])"
            let url = URL(string: "\(objectItemDataStorage.RiceImageUrl[indexPath.row])")
            cell.imgProductImage.kf.setImage(with: url)
        }
        else if objectItemDataStorage.choice == 2 {
            cell.lblProductName.text = objectItemDataStorage.SauceProductName[indexPath.row]
            cell.lblProductDiscount.text = "\(objectItemDataStorage.SauceProductDiscount[indexPath.row])% OFF"
            cell.lblProductWeight.text = "\(objectItemDataStorage.SauceProductWeight)ml"
            cell.lblProductPrice.text = "Rs.\(objectItemDataStorage.SauceProductPrice[indexPath.row])"
            let url = URL(string: "\(objectItemDataStorage.SauceImageUrl[indexPath.row])")
            cell.imgProductImage.kf.setImage(with: url)
        }
        else if objectItemDataStorage.choice == 3 {
            cell.lblProductName.text = objectItemDataStorage.ChocolateProductName[indexPath.row]
            cell.lblProductDiscount.text = "\(objectItemDataStorage.ChocolateProductDiscount[indexPath.row])% OFF"
            cell.lblProductWeight.text = "\(objectItemDataStorage.ChocolateProductWeight)g"
            cell.lblProductPrice.text = "Rs.\(objectItemDataStorage.ChocolateProductPrice[indexPath.row])"
            let url = URL(string: "\(objectItemDataStorage.ChocolateImageUrl[indexPath.row])")
            cell.imgProductImage.kf.setImage(with: url)
        }
        else if objectItemDataStorage.choice == 4 {
            cell.lblProductName.text = objectItemDataStorage.MilkProductName[indexPath.row]
            cell.lblProductDiscount.text = "\(objectItemDataStorage.MilkProductDiscount[indexPath.row])% OFF"
            cell.lblProductWeight.text = "\(objectItemDataStorage.MilkProductWeight)ml"
            cell.lblProductPrice.text = "Rs.\(objectItemDataStorage.MilkProductPrice[indexPath.row])"
            let url = URL(string: "\(objectItemDataStorage.MilkImageUrl[indexPath.row])")
            cell.imgProductImage.kf.setImage(with: url)
        }
        return cell
    } 
}
