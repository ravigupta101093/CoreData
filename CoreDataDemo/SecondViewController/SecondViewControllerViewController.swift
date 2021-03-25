//
//  SecondViewControllerViewController.swift
//  CoreDataDemo
//
//  Created by Ravi kumar gupta on 14/03/21.
//

import UIKit

class SecondViewControllerViewController: UIViewController,upDateData{
    
    
    
    
    @IBOutlet weak var table_View: UITableView!
    
    var dic_Data = [Person]()
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    var data = 0
    var firstName = String()
    var lastName = String()
    var mobileNumber = String()
    var email = String()
    var password = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.table_View.delegate = self
        self.table_View.dataSource = self
        dic_Data = DatabaseHelper.shareInstance.getAllData()
        print(dic_Data)
    }
    
    func updatedData(firstname: String, lastName: String, email: String, password: String, mobileNumber: String) {
        
        self.firstName = firstname
        self.lastName = lastName
        self.email = email
        self.mobileNumber = mobileNumber
        self.password = password
        
        dic_Data[data].firstName = firstName
        dic_Data[data].lastName = lastName
        dic_Data[data].mobileNumber = mobileNumber
        dic_Data[data].email = email
        dic_Data[data].password = password
        data = -1
        self.table_View.reloadData()
        
    }
    

}


extension SecondViewControllerViewController:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dic_Data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.table_View.dequeueReusableCell(withIdentifier: "SecondTableViewCell") as! SecondTableViewCell
        cell.label1.text! = String(describing:dic_Data[indexPath.row].firstName ?? "")
        cell.label2.text! = String(describing:dic_Data[indexPath.row].lastName ?? "")
        cell.label3.text! = String(describing:dic_Data[indexPath.row].mobileNumber ?? "")
        cell.label4.text! = String(describing:dic_Data[indexPath.row].email ?? "")
        cell.label5.text! = String(describing:dic_Data[indexPath.row].password ?? "")
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = self.storyboard?.instantiateViewController(identifier: "ThirdViewController") as! ThirdViewController
        vc.firstName = String(describing:dic_Data[indexPath.row].firstName ?? "")
        vc.lastName = String(describing:dic_Data[indexPath.row].lastName ?? "")
        vc.mobileNumber = String(describing:dic_Data[indexPath.row].mobileNumber ?? "")
        vc.email = String(describing:dic_Data[indexPath.row].email ?? "")
        vc.password = String(describing: dic_Data[indexPath.row].password ?? "")
        vc.updateDelegate = self
        self.data = indexPath.row
        self.navigationController?.pushViewController(vc, animated:true)
    }
    
}
