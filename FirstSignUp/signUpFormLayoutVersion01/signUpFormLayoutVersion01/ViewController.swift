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
    @IBOutlet weak var dateDateOfBirth: UIDatePicker!
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.txtFirstName.resignFirstResponder()
        self.txtLastName.resignFirstResponder()
        self.txtEmail.resignFirstResponder()
        self.txtPassword.resignFirstResponder()
        self.txtConfirmPassword.resignFirstResponder()
        self.txtAreaCode.resignFirstResponder()
        self.txtPhoneNumber.resignFirstResponder()
    }
    
    // returning keyboard when pressing the return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    @IBAction func btnRegisterAction(_ sender: Any)
    {
        //checking the name fields whether they are empty or not
        if txtFirstName.text?.characters.count == 0 || txtLastName.text?.characters.count == 0 || txtEmail.text?.characters.count == 0 || txtPassword.text?.characters.count == 0 || txtConfirmPassword.text?.characters.count == 0 || (segmentGenderSelection.selectedSegmentIndex != 0 && segmentGenderSelection.selectedSegmentIndex != 1)/* || txtAreaCode.text?.characters.count == 0 || txtPhoneNumber.text?.characters.count == 0*/
        {
            let alertController = UIAlertController(title: "Error!!!", message: "Field/Fields Are still empty!!!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            /*{
             (action: UIAlertAction) in print("pressed OK button");
             }*/
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
        }
            let ValidityOfEmail = isValidEmail(testStr: txtEmail.text!)
            if ValidityOfEmail == false
            {
                let alertController = UIAlertController(title: "Error!!!", message: "Invalid Email id", preferredStyle: .alert)
                let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                /*{
                 (action: UIAlertAction) in print("pressed OK button");
                 }*/
                alertController.addAction(OKAction)
                self.present(alertController, animated: true, completion: nil)
            }
            else {
                print("Valid email")
            }
            let ValidityOfPhoneNumber = validateMobileNo(value: txtPhoneNumber.text!)
            if ValidityOfPhoneNumber == false
            {
                let alertController = UIAlertController(title: "Error!!!", message: "Invalid phoneNumber", preferredStyle: .alert)
                let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                /*{
                 (action: UIAlertAction) in print("pressed OK button");
                 }*/
                alertController.addAction(OKAction)
                self.present(alertController, animated: true, completion: nil)
            }
            
            let ValidityOfFirstName = isValidInputName(Input: txtFirstName.text!)
            let ValidityOfLastName = isValidInputName(Input: txtLastName.text!)
            
            if ValidityOfFirstName == false
            {
                let alertController = UIAlertController(title: "Error!!!", message: "Other than character in Firstname field", preferredStyle: .alert)
                let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                /*{
                 (action: UIAlertAction) in print("pressed OK button");
                 }*/
                alertController.addAction(OKAction)
                self.present(alertController, animated: true, completion: nil)
            }
            if ValidityOfLastName == false
            {
                let alertController = UIAlertController(title: "Error!!!", message: "Other than character in Lastname field", preferredStyle: .alert)
                let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                /*{
                 (action: UIAlertAction) in print("pressed OK button");
                 }*/
                alertController.addAction(OKAction)
                self.present(alertController, animated: true, completion: nil)
            }
            if txtPassword.text != txtConfirmPassword.text
            {
                let alertController = UIAlertController(title: "Error!!!", message: "password and confirm password not match", preferredStyle: .alert)
                let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                /*{
                 (action: UIAlertAction) in print("pressed OK button");
                 }*/
                alertController.addAction(OKAction)
                self.present(alertController, animated: true, completion: nil)
            }
        ////////////////////////////////date validation//////////////////////////////////////////////////////////
            //dateDateOfBirth.datePickerMode = .date
            dateDateOfBirth.datePickerMode = UIDatePickerMode.date
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMM yyyy"
            let selectedDate = dateFormatter.string(from: dateDateOfBirth.date)
            print(selectedDate)
            //get current date
            let currentDate = Date()
            //let dateFormatter = DateFormatter()
            let myDate = dateFormatter.string(from: currentDate)
            var result = Bool()
            //let DateCondition = validateDateOfBirth(passedValueOfDate: selectedDate)
            if myDate <= selectedDate
            {
                result = false
                let alertController = UIAlertController(title: "error", message: "You Have not set your Date of birth or Your Entered date of birth is invalid.", preferredStyle: .alert)
                let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                /*{
                 (action: UIAlertAction) in print("pressed OK button");
                 }*/
                alertController.addAction(OKAction)
                self.present(alertController, animated: true, completion: nil)
            }
            else
            {
                result = true
            }

        ////////////////////////////////////////////date validation ends////////////////////////////////////////
            // final display of success if every field is correctly entered
            if ValidityOfEmail == true && ValidityOfLastName == true && ValidityOfFirstName == true && ValidityOfPhoneNumber == true && txtConfirmPassword.text == txtPassword.text && result == true
            {
                let alertController = UIAlertController(title: "Success!!!!", message: "you are registered", preferredStyle: .alert)
                let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                /*{
                 (action: UIAlertAction) in print("pressed OK button");
                 }*/
                alertController.addAction(OKAction)
                self.present(alertController, animated: true, completion: nil)

            }
        }
    }




