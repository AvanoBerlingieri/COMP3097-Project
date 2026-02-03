//
//  TaskController.swift
//  todo
//
//  Created by Avano Berlingieri on 2026-02-02.
//

import Foundation
import UIKit
internal import Combine

class TaskController: ObservableObject {
    @Published var tasks: [Task] = []
    
    func addTask(_ task: Task){
        tasks.append(task)
    }
    
    func viewTask(_ id: UUID){
        // TODO
    }
    
    func updateTask(_ task: Task, id: UUID){
        // TODO
    }
    
    func deleteTask(_ id: UUID){
        // TODO
    }
    
    func searchTask(_ keyword: String){
        // TODO
    }
    
    func markTaskCompleted(){
        // TODO
    }
    
}
