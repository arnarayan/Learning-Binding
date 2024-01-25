//
//  PriorityEnum.swift
//  Learning-Binding
//
//  Created by Anand Narayan on 2024-01-22.
//

import Foundation
import RealmSwift

enum PriorityEnum: String, CaseIterable, PersistableEnum {
    case low = "Low"
    case medium = "Medium"
    case high = "High"
}
