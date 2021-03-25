//
//  DataBaseHelper.swift
//  CoreDataDemo
//
//  Created by Ravi kumar gupta on 14/03/21.
//


import Foundation
import CoreData
import UIKit

class DatabaseHelper{
    
    static let shareInstance = DatabaseHelper()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func save(object:[String:String]) {
        
        let entityName = NSEntityDescription.insertNewObject(forEntityName: "Person", into: context) as! Person
        entityName.email = object["email"]
        entityName.firstName = object["firstName"]
        entityName.lastName = object["lastName"]
        entityName.mobileNumber = object["mobileNumber"]
        entityName.password = object["password"]
        
        do {
            try context.save()
            
        } catch {
            
            print("Data not save")
        }
    }
    func getAllData() -> [Person]{
        
        var person:[Person] = []
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
        do{
            person = try context.fetch(fetchRequest) as! [Person]
            
        } catch {
            
            print("Not get data")
            
        }
        
        return person
    }
}

