//
//  Party+CoreDataProperties.swift
//  PartyMakerPisotskiy
//
//  Created by Intern01 on 2/8/17.
//  Copyright © 2017 Intern01. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Party {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Party> {
        return NSFetchRequest<Party>(entityName: "Party");
    }

    @NSManaged public var info: String?
    @NSManaged public var date: NSDate?
    @NSManaged public var icon: String?
    @NSManaged public var name: String?

}
