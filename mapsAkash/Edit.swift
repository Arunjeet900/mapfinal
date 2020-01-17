//
//  Edit.swift
//  mapsAkash
//
//  Created by MacStudent on 2020-01-16.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import Foundation
import UIKit

import CoreData

class Edit: UIViewController{
    
    
    var refreshControl = UIRefreshControl()
    var locaton = Location()
    
    var locArray = [Location]()
    var pinArray = [Location]()
    
    @IBOutlet weak var mapTitle: UITextField!
    @IBOutlet weak var mapSubTitle: UITextField!
    @IBOutlet weak var mapLatitude: UITextField!
    @IBOutlet weak var mapLongitude: UITextField!
    @IBOutlet weak var doneBtn: UIBarButtonItem!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func doneBtnPressed(_ sender: Any)
    {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    @IBAction func addBtnPressed(_ sender: Any) {
        insertRecord(title: mapTitle.text!, subtitle: mapSubTitle.text!, latitude: Double( mapLatitude.text!)!, longitude: Double(mapLongitude.text!)!)
        
    }
    
    
    func insertRecord(title:String, subtitle:String, latitude:Double, longitude:Double){
        let loc = Location(context: ViewController.managedContext)
        loc.mapTitle = title
        loc.mapSubTitle = subtitle
        loc.mapLatutude =   latitude
        loc.mapLongitude = longitude
        try! ViewController.managedContext.save()
    }
    
    
    func fetchRecords() -> [Location]{
        var arrLoc = [Location]()
        let fetchRequest = NSFetchRequest<Location>(entityName: "Location")
        
        do{
            arrLoc = try ViewController.managedContext.fetch(fetchRequest)
        }catch{
            print(error)
        }
        return arrLoc
    }
    
    
    func deleteRecord( person : Location){
        ViewController.managedContext.delete(person)
        try! ViewController.managedContext.save()
    }
    func updateRecord(title:String, subtitle:String, latitude:Double, longitude:Double){
        let person = Location(context: ViewController.managedContext)
        
        person.mapTitle = title
        person.mapSubTitle = subtitle
        person.mapLatutude =   latitude
        person.mapLongitude = longitude
        try! ViewController.managedContext.save()
    }
}
