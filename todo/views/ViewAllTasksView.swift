//
//  ViewAllTasksView.swift
//  todo
//
//  Created by Nima Abady on 2026-02-07.
//

import SwiftUI

struct ViewAllTasksView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea()

             

                VStack {
                    Spacer()
                    TaskCardView(task: exampleTasks[0])
                    TaskCardView(task: exampleTasks[1])
                    TaskCardView(task: exampleTasks[2])

                    Spacer()
                    HStack {
                        Spacer()
                        VStack {
                            Spacer()
                            Button(action: {}) {
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
                            Button(action: {}) {
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
}

#Preview {
    ViewAllTasksView()
}
