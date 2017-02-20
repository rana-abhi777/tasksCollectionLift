//
//  ViewController.swift
//  CoreDataImplement
//
//  Created by Sierra 4 on 13/02/17.
//  Copyright © 2017 code-brew. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtlastName: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    
    
    var names = NSManagedObject()
    var firstName = String()
    var lastName = String()
    var age = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnSaveClick(_ sender: Any) {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let names = Names(context: context)
        
        names.setValue(txtFirstName.text, forKey: "first")
        names.setValue(txtlastName, forKey: "last")
        names.setValue(txtAge.text, forKey: "age")
        
        appDelegate.saveContext()
    }
    @IBAction func btnNextClick(_ sender: Any) {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        
    }

