//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Ravi kumar gupta on 14/03/21.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    
    @IBOutlet weak var firstName_TextField: UITextField!
    @IBOutlet weak var lastname_TexttField: UITextField!
    @IBOutlet weak var mobileNumber_Textfield: UITextField!
    @IBOutlet weak var email_Textfield: UITextField!
    @IBOutlet weak var password_TextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func submit(_ sender:UIButton) {
      
        let dict : [String:String] = ["firstName":firstName_TextField.text!,"lastName":lastname_TexttField.text!,"mobileNumber":mobileNumber_Textfield.text!,"email":email_Textfield.text!,"password":password_TextField.text!]
        
        DatabaseHelper.shareInstance.save(object: dict)
        
        
        let vc = self.storyboard?.instantiateViewController(identifier: "SecondViewControllerViewController") as! SecondViewControllerViewController
        self.navigationController?.pushViewController(vc, animated:true)
        
    }
}

