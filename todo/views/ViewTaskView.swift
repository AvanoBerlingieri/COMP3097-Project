//
//  ViewTaskView.swift
//  todo
//
//  Created by Nima Abady on 2026-02-08.
//

import SwiftUI
import SwiftData

struct ViewTaskView: View {
    let task: Task
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        VStack {
                            Spacer()
                            VStack{
                                HStack{
                                    Text("Description: ")
                                        .font(.title2)
                                        .bold()
                                        .foregroundColor(.white)
                                    Text(task.descriptions)
                                        .font(.headline)
                                        .bold()
                                        .foregroundColor(.white)
                                }.padding(.bottom, 20)
                                
                                HStack{
                                    Text("Task Type: ")
                                        .font(.title2)
                                        .bold()
                                        .foregroundColor(.white)
                                    Text(task.taskType)
                                        .font(.headline)
                                        .bold()
                                        .foregroundColor(.white)
                                }.padding(.bottom, 20)
                                HStack{
                                    Text("Due Date: ")
                                        .font(.title2)
                                        .bold()
                                        .foregroundColor(.white)
                                    Text(task.dueDate, style: .date)
                                        .font(.headline)
                                        .bold()
                                        .foregroundColor(.white)
                                }.padding(.bottom, 20)
                                HStack{
                                    Text("Task Completed: ")
                                        .font(.title2)
                                        .bold()
                                        .foregroundColor(.white)
                                    Text(task.isCompleted.description)
                                        .font(.headline)
                                        .bold()
                                        .foregroundColor(.white)
                                }.padding(.bottom, 20)
                            }
                            
                            
                            Spacer()
                            Button(action: {
                                task.isCompleted = true
                                dismiss()
                            }) {
                                HStack(spacing: 12) {
                                    Text("Mark as Completed")
                                        .font(.title2)
                                        .padding(.leading, 130)
                                    Spacer()
                                    Image(systemName: "checkmark")
                                        .font(.system(size: 28))
                                        .padding(.trailing, 10)
                                }
                                .padding(.bottom, 15)
                                .padding(.trailing, 10)
                            }
                            Button(action: {
                                modelContext.delete(task)
                                dismiss()
                            }) {
                                HStack(spacing: 12) {
                                    Text("Delete Task")
                                        .font(.title2)
                                        .padding(.leading, 130)
                                    Spacer()
                                    Image(systemName: "trash")
                                        .font(.system(size: 28))
                                        .padding(.trailing, 10)
                                }
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, minHeight: 70)
                                .background(Color("ButtonColor"))
                                .cornerRadius(16)
                                .shadow(radius: 5)
                            }
                            .padding(.bottom, 30)
                            .padding(.trailing, 10)
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(task.title)
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                }
            }
            .toolbarBackground(Color.gray, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
}
