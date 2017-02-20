//
//  ViewController.swift
//  TableViewSample
//
//  Created by iReaper on 06/02/17.
//  Copyright © 2017 Codebrew. All rights reserved.
//


import UIKit


class ViewController: UIViewController {

    var currentCount:Int = 0
    var sectedIndex:Int = -1
    var varUserData:[String:Any]?
    
    var arrStudent = [[
        Students(title: "Gagan", desc: "Test 0", arrSubData:["a","b","c","d"]) ,
        Students(title: "Suvadeep", desc: "Test 1", arrSubData:["a","b","c","d"]),
        Students(title: "Prince", desc: "Test 2", arrSubData:["a","b","c","d"]),
        Students(title: "Himanshu", desc: "Test 3", arrSubData:["a","b","c","d"]),
        Students(title: "Gagan1", desc: "Test 01", arrSubData:["a","b","c","d"]) ,
        Students(title: "Suvadeep1", desc: "Test 11", arrSubData:["a","b","c","d"]),
        Students(title: "Prince1", desc: "Test 21", arrSubData:["a","b","c","d"]),
        Students(title: "Himanshu1", desc: "Test 31", arrSubData:["a","b","c","d"])
        ],[
            Students(title: "Gagan", desc: "Test 0", arrSubData:["a","b","c","d"]) ,
            Students(title: "Suvadeep", desc: "Test 1", arrSubData:["a","b","c","d"]),
            Students(title: "Prince", desc: "Test 2", arrSubData:["a","b","c","d"]),
            Students(title: "Himanshu", desc: "Test 3", arrSubData:["a","b","c","d"]),
            Students(title: "Gagan1", desc: "Test 01", arrSubData:["a","b","c","d"]) ,
            Students(title: "Suvadeep1", desc: "Test 11", arrSubData:["a","b","c","d"]),
            Students(title: "Prince1", desc: "Test 21", arrSubData:["a","b","c","d"]),
            Students(title: "Himanshu1", desc: "Test 31", arrSubData:["a","b","c","d"])
        ],[
            Students(title: "Gagan", desc: "Test 0", arrSubData:["a","b","c","d"]) ,
            Students(title: "Suvadeep", desc: "Test 1", arrSubData:["a","b","c","d"]),
            Students(title: "Prince", desc: "Test 2", arrSubData:["a","b","c","d"]),
            Students(title: "Himanshu", desc: "Test 3", arrSubData:["a","b","c","d"]),
            Students(title: "Gagan1", desc: "Test 01", arrSubData:["a","b","c","d"]) ,
            Students(title: "Suvadeep1", desc: "Test 11", arrSubData:["a","b","c","d"]),
            Students(title: "Prince1", desc: "Test 21", arrSubData:["a","b","c","d"]),
            Students(title: "Himanshu1", desc: "Test 31", arrSubData:["a","b","c","d"])
        ],[
            Students(title: "Gagan", desc: "Test 0", arrSubData:["a","b","c","d"]) ,
            Students(title: "Suvadeep", desc: "Test 1", arrSubData:["a","b","c","d"]),
            Students(title: "Prince", desc: "Test 2", arrSubData:["a","b","c","d"]),
            Students(title: "Himanshu", desc: "Test 3", arrSubData:["a","b","c","d"]),
            Students(title: "Gagan1", desc: "Test 01", arrSubData:["a","b","c","d"]) ,
            Students(title: "Suvadeep1", desc: "Test 11", arrSubData:["a","b","c","d"]),
            Students(title: "Prince1", desc: "Test 21", arrSubData:["a","b","c","d"]),
            Students(title: "Himanshu1", desc: "Test 31", arrSubData:["a","b","c","d"])
        ]]
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
//MARK: - TableView Datasources/Delegates
extension ViewController : UITableViewDataSource  , UITableViewDelegate{
    
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        
//        currentCount = (arrStudent[indexPath.section][indexPath.row].arrSubData?.count)!
//        
//    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrStudent.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrStudent[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else{
            fatalError()
        }
        cell.student = arrStudent[indexPath.section][indexPath.row]
        
        if(sectedIndex == indexPath.row) {
            cell.lblDesc.backgroundColor = UIColor.cyan
        }
        else {
             cell.lblDesc.backgroundColor = UIColor.init(red: 255/255.0, green: 208/255.0, blue: 72/255.0, alpha: 1)
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let tempStudent = students[indexPath.row]
//        guard let studentName = tempStudent.title else{return}
//        print("Student which was clicked = \(studentName)")
        
        let tempUserData = arrStudent[indexPath.section][indexPath.row]
        varUserData = ["title":tempUserData.title ?? "","desc":tempUserData.desc ?? "","subData":tempUserData.arrSubData ?? []]
        sectedIndex = indexPath.row
        self.performSegue(withIdentifier: "", sender: self)
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section no \(section)"
    }
   
    
    
}

