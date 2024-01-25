//
//  Task.swift
//  Learning-Binding
//
//  Created by Anand Narayan on 2024-01-20.
//

import Foundation
import RealmSwift



public class Task: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    
    @Persisted var title: String = ""
    @Persisted var isCompleted: Bool = false
    @Persisted var priority: PriorityEnum = PriorityEnum.medium
}
