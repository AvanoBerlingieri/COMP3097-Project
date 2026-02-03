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
