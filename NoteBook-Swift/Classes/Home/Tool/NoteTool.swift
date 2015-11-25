//
//  NoteTool.swift
//  NoteBook-Swift
//
//  Created by Lorin on 15/11/24.
//  Copyright © 2015年 LorinRain. All rights reserved.
//

import UIKit
import CoreData

class NoteTool: NSObject {
    var myDelegate = AppDelegate()
    
    override init() {
        super.init()
        self.myDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    }
    
    // MARK: CoreData, Add
    func addNewNote(content: String) {
        let newNote = NSEntityDescription.insertNewObjectForEntityForName("Note", inManagedObjectContext: self.myDelegate.managedObjectContext) as! Note
        newNote.notedetail = content
        // get current date
        let dateFormatter = NSDateFormatter.init()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = dateFormatter.stringFromDate(NSDate.init(timeIntervalSinceNow: 0))
        newNote.date = dateString
        
        // save
        self.myDelegate.saveContext()
    }
    
    // MARK: CoreData, query
    func findAll() -> NSArray {
        // create a query request
        let request = NSFetchRequest.init()
        // set query entity
        let entity = NSEntityDescription.entityForName("Note", inManagedObjectContext: self.myDelegate.managedObjectContext)
        request.entity = entity
        
        // sort
        let sort = NSSortDescriptor(key: "date", ascending: false)
        let sortArray = NSArray(object: sort)
        request.sortDescriptors = sortArray as? [NSSortDescriptor]
        
        // query
        let result = try! self.myDelegate.managedObjectContext.executeFetchRequest(request) as NSArray
        
        return result
    }
    
    // MARK: CoreData, Update
    func updateNote(note: Note, content: String) {
        // create a query request
        let request = NSFetchRequest.init()
        // set query entity
        let entity = NSEntityDescription.entityForName("Note", inManagedObjectContext: self.myDelegate.managedObjectContext)
        request.entity = entity
        
        // set query terms
        let predice = NSPredicate(format: "date = %@", note.date!)
        request.predicate = predice
        
        // query
        let result = try! self.myDelegate.managedObjectContext.executeFetchRequest(request) as NSArray
        
        // set date
        let dateFormatter = NSDateFormatter.init()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = dateFormatter.stringFromDate(NSDate.init(timeIntervalSinceNow: 0))
        note.date = dateString
        note.notedetail = content
        
        if(result.count > 0) {
            let tempNote = result.lastObject as! Note
            tempNote.notedetail = note.notedetail
            tempNote.date = note.date
            
            // save
            self.myDelegate.saveContext()
        }
    }
    
    // MARK: CoreData, Delete
    func deleteNote(note: Note) {
        // create a query request
        let request = NSFetchRequest.init()
        // set entity
        let entity = NSEntityDescription.entityForName("Note", inManagedObjectContext: self.myDelegate.managedObjectContext)
        request.entity = entity
        
        // set query terms
        let predice = NSPredicate(format: "date = %@", note.date!)
        request.predicate = predice
        
        let result = try! self.myDelegate.managedObjectContext.executeFetchRequest(request) as NSArray
        
        if(result.count > 0) {
            let tempNote = result.lastObject as! Note
            self.myDelegate.managedObjectContext.deleteObject(tempNote)
            
            // save
            self.myDelegate.saveContext()
        }
    }
    
}



