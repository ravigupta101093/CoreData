//
//  ThirdViewController.swift
//  CoreDataDemo
//
//  Created by Ravi kumar gupta on 14/03/21.
//

import UIKit
import CoreData


protocol upDateData {
    
    func updatedData(firstname:String,lastName:String,email:String,password:String,mobileNumber:String)
}

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var firstName_TextField: UITextField!
    @IBOutlet weak var lastname_TexttField: UITextField!
    @IBOutlet weak var mobileNumber_Textfield: UITextField!
    @IBOutlet weak var email_Textfield: UITextField!
    @IBOutlet weak var password_TextField: UITextField!
    
    var firstName = String()
    var lastName = String()
    var mobileNumber = String()
    var email = String()
    var password = String()
    var updateDelegate : upDateData?
    var appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()

        firstName_TextField.text! = firstName
        lastname_TexttField.text! = lastName
        mobileNumber_Textfield.text! = mobileNumber
        email_Textfield.text! = email
        password_TextField.text! = password
       
    }
    
    @IBAction func submit(_ sender:UIButton) {
        
        
        let vc = self.storyboard?.instantiateViewController(identifier: "SecondViewControllerViewController") as! SecondViewControllerViewController
        updateDelegate?.updatedData(firstname:firstName_TextField.text!, lastName:lastname_TexttField.text!, email: email_Textfield.text!, password:password_TextField.text!, mobileNumber: mobileNumber_Textfield.text!)
        appDelegate.saveContext()
        self.navigationController?.popViewController(animated: true)
    }
    
}
