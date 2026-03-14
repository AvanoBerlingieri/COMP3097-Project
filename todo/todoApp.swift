//
//  todoApp.swift
//  todo
//
//  Created by Avano Berlingieri on 2026-02-02.
//

import SwiftUI
import SwiftData

@main
struct todoApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }.modelContainer(for: Task.self)
    }
}
