//
//  ViewController.swift
//  FirstTableView
//
//  Created by Sierra 4 on 07/02/17.
//  Copyright © 2017 code-brew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableTheTableView: UITableView!
    
    let list = ["tata", "pablo", "escobar", "guiverria", "murphy"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    /*func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    */
    // functio for number of rows in a given section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    //function for giving header to a section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Wheat & Flour"
    }
    //function for defining the table: initialising the table and making cells reusable
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Task2TableViewCell", for: indexPath) as? Task2TableViewCell else {
            fatalError()
        }
        cell.lblFirstLabel.text = list[indexPath.row]
        return cell
    }
    //function for the action if a given cell is selected in the table
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell \(indexPath.row)")
    }
    
}

