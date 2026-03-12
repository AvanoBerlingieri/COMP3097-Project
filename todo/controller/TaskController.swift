//
//  TaskController.swift
//  todo
//
//  Created by Avano Berlingieri on 2026-02-02.
//

import Foundation
import Combine


class TaskController: ObservableObject {
    @Published var tasks: [Task] = []
    
    init() {
        loadTasks()
    }

    func addTask(_ task: Task) {
        DatabaseManager.shared.insertTask(task: task)
        loadTasks()
    }

    func loadTasks() {
        tasks = DatabaseManager.shared.fetchTasks()
    }
    
    func viewTask(_ id: UUID){
        // TODO
    }
    
    func updateTask(_ task: Task, id: UUID){
        // TODO
    }
    
    func deleteTask(_ id: UUID) {
        DatabaseManager.shared.deleteTask(id: id)
        loadTasks()
    }
    
    func searchTask(_ keyword: String){
        // TODO
    }
    
    
    func markTaskCompleted(_ id: UUID) {

        if let index = tasks.firstIndex(where: { $0.id == id }) {

            let updatedTask = Task(
                id: tasks[index].id,
                title: tasks[index].title,
                description: tasks[index].description,
                taskType: tasks[index].taskType,
                dueDate: tasks[index].dueDate,
                isCompleted: true
            )

            deleteTask(id)
            addTask(updatedTask)
        }
    }
    
}
