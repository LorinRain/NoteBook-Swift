//
//  Note+CoreDataProperties.swift
//  NoteBook-Swift
//
//  Created by Lorin on 15/11/24.
//  Copyright © 2015年 LorinRain. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Note {

    @NSManaged var notedetail: String?
    @NSManaged var date: String?

}
