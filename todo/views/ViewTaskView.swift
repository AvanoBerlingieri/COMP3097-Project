//
//  ViewTaskView.swift
//  todo
//
//  Created by Nima Abady on 2026-02-08.
//

import SwiftUI

struct ViewTaskView: View {
    let task: Task
    
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
                                    Text(task.description)
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
                            }
                            
                            
                            Spacer()
                            Button(action: {}) {
                                HStack(spacing: 12) {
                                    Text("Mark As Completed")
                                        .font(.title2)
                                        .padding(.leading, 130)
                                    Spacer()
                                    Image(systemName: "checkmark")
                                        .font(.system(size: 28))
                                        .padding(.trailing, 10)
                                }
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, minHeight: 70)
                                .background(Color("ButtonColor"))
                                .cornerRadius(16)
                                .shadow(radius: 5)
                            }
                            .padding(.bottom, 15)
                            .padding(.trailing, 10)
                            Button(action: {}) {
                                HStack(spacing: 12) {
                                    Text("Edit Task")
                                        .font(.title2)
                                        .padding(.leading, 130)
                                    Spacer()
                                    Image(systemName: "pencil")
                                        .font(.system(size: 28))
                                        .padding(.trailing, 10)
                                }
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, minHeight: 70)
                                .background(Color("ButtonColor"))
                                .cornerRadius(16)
                                .shadow(radius: 5)
                            }
                            .padding(.bottom, 15)
                            .padding(.trailing, 10)
                            Button(action: {}) {
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

extension Task{
    static let preview = TaskData.exampleTasks[0]
}

#Preview {
    ViewTaskView(task: .preview)
}
