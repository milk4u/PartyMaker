//
//  DancingParty+CoreDataProperties.swift
//  PartyMakerPisotskiy
//
//  Created by Intern01 on 2/8/17.
//  Copyright © 2017 Intern01. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension DancingParty {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DancingParty> {
        return NSFetchRequest<DancingParty>(entityName: "DancingParty");
    }

    @NSManaged public var musicGenre: String?

}
