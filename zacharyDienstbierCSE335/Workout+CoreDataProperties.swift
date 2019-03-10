//
//  Workout+CoreDataProperties.swift
//  zacharyDienstbierCSE335
//
//  Created by Guest User on 3/9/19.
//  Copyright © 2019 Guest User. All rights reserved.
//
//

import Foundation
import CoreData


extension Workout {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Workout> {
        return NSFetchRequest<Workout>(entityName: "Workout")
    }

    @NSManaged public var title: String?
    @NSManaged public var type: String?
    @NSManaged public var set: String?
    @NSManaged public var notes: String?
    @NSManaged public var location: NSObject?

}
