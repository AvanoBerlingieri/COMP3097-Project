//
//  ViewAllTasksView.swift
//  todo
//
//  Created by Nima Abady on 2026-02-07.
//

import SwiftUI


struct ViewAllTasksView: View {

    @State private var tasks = TaskData.exampleTasks

    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()

            VStack {
                Spacer()
                
                HStack {
                    ZStack(alignment: .trailing) {
                        TextField("Search", text: $title)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                        
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white.opacity(0.7))
                            .padding(.trailing, 10)
                    }
                }
                
                ForEach(tasks) { task in
                    NavigationLink(destination: ViewTaskView(task: task)) {
                        TaskCardView(task: task)
                            .foregroundColor(.black)
                    }
                }

                Spacer()

                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        NavigationLink(destination: AddTasksView()) {
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .font(.system(size: 40))
                                .padding()
                                .background(Color("ButtonColor"))
                                .clipShape(Circle())
                                .shadow(radius: 5)
                        }
                        .padding(.bottom, 15)
                        .padding(.trailing, 20)

                        NavigationLink(destination: EditTaskView()) {
                            Image(systemName: "checkmark")
                                .foregroundColor(.white)
                                .font(.system(size: 40))
                                .padding()
                                .background(Color("ButtonColor"))
                                .clipShape(Circle())
                                .shadow(radius: 5)
                        }
                        .padding(.bottom, 30)
                        .padding(.trailing, 20)
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("View Tasks")
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
    ViewAllTasksView()
}
