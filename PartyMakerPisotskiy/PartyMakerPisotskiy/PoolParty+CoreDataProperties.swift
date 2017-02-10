//
//  PoolParty+CoreDataProperties.swift
//  PartyMakerPisotskiy
//
//  Created by Intern01 on 2/8/17.
//  Copyright © 2017 Intern01. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension PoolParty {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PoolParty> {
        return NSFetchRequest<PoolParty>(entityName: "PoolParty");
    }

    @NSManaged public var towelRequired: Bool

}
