//
//  Update.swift
//  mapsAkash
//
//  Created by MacStudent on 2020-01-16.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import Foundation
import UIKit
import CoreData


class Update:UIViewController{
    
    
    var locArray = Location()
    var locaton = Location()
    
    @IBOutlet weak var updateTitle: UITextField!
    @IBOutlet weak var updateSub: UITextField!
    @IBOutlet weak var updateLati: UITextField!
    @IBOutlet weak var updateLongi: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        updateTitle.text = locaton.mapTitle
        updateSub.text = locaton.mapSubTitle
        updateLati.text = String(locaton.mapLatutude)
        updateLongi.text = locaton.mapLongitude.description
    }
   
    
}

extension Update{
    
    //sareya deaction ethe ne
    
    @IBAction func updateBtn(_ sender: Any)
    {
        self.updateRecord(location: locaton, title: updateTitle.text!, subTitle: updateSub.text!, latitude: Double(updateLati.text!)!, longitude: Double(updateLongi.text!)!)
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    
    @IBAction func deleteBtnTapped(_ sender: Any) {
        
        
        deleteRecord(locObject: locaton)
        
    }
    
    
    func deleteRecord( locObject : Location){
        ViewController.managedContext.delete(locObject)
        try! ViewController.managedContext.save()
    }
    
    func updateRecord(location:Location,title:String,subTitle:String,latitude: Double,longitude: Double){
        
        
        location.mapTitle = title
        location.mapSubTitle = subTitle
        location.mapLatutude = latitude
        location.mapLongitude = longitude
        try! ViewController.managedContext.save()
    }
    
    
}
