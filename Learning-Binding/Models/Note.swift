//
//  Note.swift
//  Learning-Binding
//
//  Created by Anand Narayan on 2024-01-27.
//

import Foundation
import RealmSwift


public class Note: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    
    @Persisted var text: String = ""
    

}

