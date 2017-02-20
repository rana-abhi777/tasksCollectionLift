//
//  ViewController.swift
//  CoreDataCompleteRun
//
//  Created by Sierra 4 on 16/02/17.
//  Copyright © 2017 code-brew. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var btnViewContacts: UIButton!
    @IBOutlet weak var btnAddToContacts: UIButton!
    
    var firstName = String()
    var lastName = String()
    
    var contact = [NSManagedObject]()
    
    //core data variables
    var index = 0
    var indexDisplay = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        btnViewContacts.layer.cornerRadius = 27
        btnViewContacts.layer.borderWidth = 2
        btnViewContacts.layer.borderColor = UIColor.white.cgColor
        
        btnAddToContacts.layer.cornerRadius = 27
        btnAddToContacts.layer.borderWidth = 2
        btnAddToContacts.layer.borderColor = UIColor.white.cgColor
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnAddToContactsClick(_ sender: Any) {
        
        
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let contact = Contacts(context: context)
        
        contact.setValue(txtFirstName.text, forKey: "firstName")
        contact.setValue(txtLastName.text, forKey: "lastName")
        do {
            try context.save()
            print("Content saved")
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    @IBAction func btnViewComplete(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Contacts")
        let context = appDelegate.persistentContainer.viewContext
        do {
            let results = try context.fetch(fetchRequest)
            if results.count > 0 {
                for task in results {
                    print("first name: \(task.value(forKeyPath: "firstName")), last name is:\(task.value(forKeyPath: "lastName"))")
                }
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }

    }
}
