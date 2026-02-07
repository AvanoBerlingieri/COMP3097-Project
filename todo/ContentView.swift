//
//  ContentView.swift
//  todo
//
//  Created by Avano Berlingieri on 2026-02-02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TaskCardView(task: Task(id: UUID(),
                                title: "Sample Text",
                                description: "Sample Text",
                                taskType: "Sample",
                                dueDate: Date(),
                                isCompleted: false))
    }
}

#Preview {
    ContentView()
}
