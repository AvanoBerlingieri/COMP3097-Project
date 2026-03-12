//
//  AddTasksView.swift
//  todo
//
//  Created by Nima Abady on 2026-02-08.
//

import SwiftUI


struct AddTasksView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var controller: TaskController

    @State private var title: String = ""
    @State private var description: String = ""
    @State private var taskType: String = ""
    @State private var dueDate = Date()

    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Title")
                        .foregroundColor(.white)
                        .bold()
                    TextField("", text: $title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                    
                    Text("Description")
                        .foregroundColor(.white)
                        .bold()
                    TextField("", text: $description)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                    
                    Text("Task Type")
                        .foregroundColor(.white)
                        .bold()
                    TextField("", text: $taskType)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                    
                    Text("Due Date")
                        .foregroundColor(.white)
                        .bold()
                    DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
                        .datePickerStyle(.compact)
                    
                    Button("Save Task") {

                        let task = Task(
                        id: UUID(),
                        title: title,
                        description: description,
                        taskType: taskType,
                        dueDate: dueDate,
                        isCompleted: false)

                        controller.addTask(task)
                        
                        HStack {
                            Spacer()
                            Text("Save Task")
                                .foregroundColor(.white)
                                .bold()
                            Spacer()                        
                        }
                        .padding()
                        .background(Color("ButtonColor"))
                        .cornerRadius(10)

                        dismiss()
                    }
                    .padding(.top, 20)
                    
                    Spacer()
                }
                .padding()
            }
        }
        .navigationBarTitle("Add Task", displayMode: .inline)
        .toolbar{
            ToolbarItem(placement: .principal) {
                Text("Add Task")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
            }
        }
        .toolbarBackground(Color.gray, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
    }
}

#Preview {
    NavigationStack {
        AddTasksView(controller: TaskController())
    }
}
