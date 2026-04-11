//
//  ViewAllTasksView.swift
//  todo
//
//  Created by Nima Abady on 2026-02-07.
//

import SwiftUI
import SwiftData

struct ViewAllTasksView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Task.title, order: .forward) var tasks: [Task]
    
    @State private var searchText: String = ""

    var filteredTasks: [Task] {
        if searchText.isEmpty {
            return tasks
        } else {
            return tasks.filter { task in
                task.title.localizedCaseInsensitiveContains(searchText) ||
                task.descriptions.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()

            VStack {
                HStack {
                    ZStack(alignment: .trailing) {
                        TextField("Search tasks...", text: $searchText)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                            .autocorrectionDisabled()
                        
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white.opacity(0.7))
                            .padding(.trailing, 10)
                    }
                }
                .padding()
                
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(filteredTasks) { task in
                            NavigationLink(destination: ViewTaskView(task: task)) {
                                TaskCardView(task: task)
                            }
                        }
                    }
                    .padding(.horizontal)
                }

                Spacer()

                HStack {
                    Spacer()
                    NavigationLink(destination: AddTasksView()) {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 30, weight: .bold))
                            .padding()
                            .background(Color("ButtonColor"))
                            .clipShape(Circle())
                            .shadow(radius: 5)
                    }
                    .padding(.trailing, 20)
                    .padding(.bottom, 20)
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
