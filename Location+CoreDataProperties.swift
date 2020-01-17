//
//  Location+CoreDataProperties.swift
//  mapsAkash
//
//  Created by MacStudent on 2020-01-16.
//  Copyright © 2020 MacStudent. All rights reserved.
//
//

import Foundation
import CoreData
import CoreLocation

extension Location {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Location> {
        return NSFetchRequest<Location>(entityName: "Location")
    }

    @NSManaged public var mapTitle: String?
    @NSManaged public var mapSubTitle: String?
    @NSManaged public var mapLatutude: Double
    @NSManaged public var mapLongitude: Double

}
