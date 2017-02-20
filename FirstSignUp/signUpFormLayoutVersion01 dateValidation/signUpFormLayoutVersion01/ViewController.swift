//
//  ViewController.swift
//  signUpFormLayoutVersion01
//
//  Created by Sierra 4 on 01/02/17.
//  Copyright © 2017 code-brew. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var txtAreaCode: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var txtDateOfBirth: UITextField!
    
    @IBOutlet weak var txtviewAboutYourself: UITextView!
    
    @IBOutlet weak var segmentGenderSelection: UISegmentedControl!
    
    // function to validate the email field
    func isValidEmail(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    /////////////////////////////////////////phone number validation////////////////////////
    // function to validate the mobile number whether it's 10  digits or not
    func validateMobileNo(value: String) -> Bool {
        let PHONE_REGEX = "^\\d{3}\\d{3}\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
    ////////////////////////////first Name and Last Name Validation////////////////////////////////
    // function to validate first name and last name whether they contain text fields only or not
    func isValidInputName(Input: String) -> Bool {
        let RegEx = "^[a-zA-Z]+$"
        let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return Test.evaluate(with: Input)
    }
    /////////////////////////////////////name validation ends///////////////////////////////////////////////////////
    // function to validate the DOB whether it matches with current date or not
    /*
    func validateDateOfBirth(passedValueOfDate: String) -> Bool
    {
        //get current date
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        let myDate = dateFormatter.string(from: currentDate)
        var result = Bool()
        if passedValueOfDate >= myDate
        {
            result = false
        }
        else
        {
            result = true
        }
        return result
    }
    */
    // genreric function for the alert message which takes title string and message string as it's arguments
    func genericAlertMessage(theTitle: String, theMessage: String)
    {
        let alertController = UIAlertController(title: theTitle, message: theMessage, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        /*{
         (action: UIAlertAction) in print("pressed OK button");
         }*/
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    //==============WORK IN PROGRESS
    let datePicker = UIDatePicker()
    func createDatePicker() {
        
        //format for picker
        datePicker.datePickerMode = .date
        
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //bar button item
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressedFromTheDatePicker))
        toolbar.setItems([doneButton], animated: false)
        
        txtDateOfBirth.inputAccessoryView = toolbar
        
        //assigning datePicker to textfield
        txtDateOfBirth.inputView = datePicker
    }
    
    func donePressedFromTheDatePicker() {
        //format date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        txtDateOfBirth.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    //get current date
    let currentDate = Date()
    //current date changed to string
    var currentDateString: String = ""
    //===================================================================
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        txtFirstName.delegate = self
        txtLastName.delegate = self
        txtEmail.delegate = self
        txtPassword.delegate = self
        txtConfirmPassword.delegate = self
        txtAreaCode.delegate = self
        txtPhoneNumber.delegate = self
        txtviewAboutYourself.becomeFirstResponder()
        
        // creation of the date picker
        createDatePicker()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        currentDateString = dateFormatter.string(from: currentDate)
        print(currentDateString)
    }
    /*override func viewDidAppear(_ animated: Bool) {
        // Show keyboard by default
        txtviewAboutYourself.becomeFirstResponder()
    }
    override func viewWillAppear(_ animated: Bool) {
        txtviewAboutYourself.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.txtFirstName.resignFirstResponder()
        self.txtLastName.resignFirstResponder()
        self.txtEmail.resignFirstResponder()
        self.txtPassword.resignFirstResponder()
        self.txtConfirmPassword.resignFirstResponder()
        self.txtAreaCode.resignFirstResponder()
        self.txtPhoneNumber.resignFirstResponder()
        self.txtviewAboutYourself.resignFirstResponder()
    }
    
    // returning keyboard when pressing the return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    //txtFirstNamereturnKeyType = UIReturnKeyNext;
    
    
    @IBAction func btnRegistrationAction(_ sender: Any) {
        //checking the name fields whether they are empty or not
        if txtFirstName.text?.characters.count == 0 || txtLastName.text?.characters.count == 0 || txtEmail.text?.characters.count == 0 || txtPassword.text?.characters.count == 0 || txtConfirmPassword.text?.characters.count == 0 || (segmentGenderSelection.selectedSegmentIndex != 0 && segmentGenderSelection.selectedSegmentIndex != 1) || txtAreaCode.text?.characters.count == 0 || txtPhoneNumber.text?.characters.count == 0
        {
            genericAlertMessage(theTitle: "Error!!!", theMessage: "Field/Fields Are still empty!!!")
        }
            let ValidityOfEmail = isValidEmail(testStr: txtEmail.text!)
            if ValidityOfEmail == false
            {
                genericAlertMessage(theTitle: "Error!!!", theMessage: "Invalid Email id")
            }
            else {
                print("Valid email")
            }
            let ValidityOfPhoneNumber = validateMobileNo(value: txtPhoneNumber.text!)
            if ValidityOfPhoneNumber == false
            {
                genericAlertMessage(theTitle: "Error!!!", theMessage: "Invalid phoneNumber")
            }
            
            let ValidityOfFirstName = isValidInputName(Input: txtFirstName.text!)
            let ValidityOfLastName = isValidInputName(Input: txtLastName.text!)
            
            if ValidityOfFirstName == false
            {
                genericAlertMessage(theTitle: "Error!!!", theMessage: "Other than character in Firstname field")
            }
            if ValidityOfLastName == false
            {
                genericAlertMessage(theTitle: "Error!!!", theMessage: "Other than character in Lastname field")
            }
            if txtPassword.text != txtConfirmPassword.text
            {
                genericAlertMessage(theTitle: "Error!!!", theMessage: "Password and Confirm Password not match")
            }
        ////////////////////////////////date validation//////////////////////////////////////////////////////////
            // date obtained from the date picker in the form
            let dateFormatter = DateFormatter()
            /*
            txtDateOfBirth.datePickerMode = UIDatePickerMode.date
         
            dateFormatter.dateFormat = "dd MMM yyyy"
            let selectedDate = dateFormatter.string(from: txtDateOfBirth.date)
            */
        
        
            //let dateFormatter = DateFormatter()
            let myDate = dateFormatter.string(from: currentDate)
            var result = Bool()
            let DOB = txtDateOfBirth.text!
            print(DOB)
            print(currentDateString)
        
        
            //current date format
        
            //let DateCondition = validateDateOfBirth(passedValueOfDate: selectedDate)
            if currentDateString >= myDate
            {
                result = false
                genericAlertMessage(theTitle: "Error", theMessage: "You have not set your Date of Birth or Your Entered Date Of Birth is invalid")
                
            }
            else
            {
                result = true
            }

        ////////////////////////////////////////////date validation ends////////////////////////////////////////
            // final display of success if every field is correctly entered
            if ValidityOfEmail == true && ValidityOfLastName == true && ValidityOfFirstName == true && ValidityOfPhoneNumber == true && txtConfirmPassword.text == txtPassword.text && result == true
            {
                genericAlertMessage(theTitle: "Success!!!!", theMessage: "You are registered")
            }
        }
    }



