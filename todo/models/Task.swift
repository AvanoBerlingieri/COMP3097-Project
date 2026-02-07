//
//  Task.swift
//  todo
//
//  Created by Avano Berlingieri on 2026-02-02.
//

import Foundation

struct Task: Identifiable {
    var id: UUID
    var title: String
    var description: String
    var taskType: String
    var dueDate: Date
    var isCompleted: Bool
}

let exampleTasks: [Task] = [
    Task(
        id: UUID(),
        title: "Finish SwiftUI Project",
        description: "Complete all screens",
        taskType: "Work",
        dueDate: Date().addingTimeInterval(60*60*24),
        isCompleted: false
    ),
    Task(
        id: UUID(),
        title: "Grocery Shopping",
        description: "Go grocery shopping",
        taskType: "Personal",
        dueDate: Date().addingTimeInterval(60*60*48),
        isCompleted: false
    ),
    Task(
        id: UUID(),
        title: "Read a Book",
        description: "Finish reading my Book",
        taskType: "Leisure",
        dueDate: Date().addingTimeInterval(60*60*72),
        isCompleted: false
    )
]
