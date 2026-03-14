//
//  TaskCard.swift
//  todo
//
//  Created by Avano Berlingieri on 2026-02-02.
//

import Foundation
import SwiftUI

struct TaskCardView:View {
    let task: Task
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack{
                Text(task.title)
                    .font(.headline)
                    .foregroundColor(.black)
                    .bold()
                
                Spacer()
                
                Text(task.taskType)
                    .font(.subheadline)
                    .foregroundColor(.black)

                    
            }
            
            HStack{
                Text(task.dueDate, style: .date)
                    .font(.caption)
                    .foregroundColor(.black)
                
                Spacer()
                
                Text(task.isCompleted ? "Completed" : "Pending")
                    .font(.caption)
                    .foregroundColor(.black)
                
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10)
            .fill(Color(.systemGray5)))
    }
}
