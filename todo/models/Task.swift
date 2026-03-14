//
//  Task.swift
//  todo
//
//  Created by Avano Berlingieri on 2026-02-02.
//

import Foundation
import SwiftData

@Model
class Task: Identifiable {
    @Attribute(.unique) var id: UUID
    var title: String
    var descriptions: String
    var taskType: String
    var dueDate: Date
    var isCompleted: Bool
    
    init(id: UUID = UUID(), title: String, descriptions: String, taskType: String, dueDate: Date, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.descriptions = descriptions
        self.taskType = taskType
        self.dueDate = dueDate
        self.isCompleted = isCompleted
    }
}
