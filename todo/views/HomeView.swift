//
//  HomeView.swift
//  todo
//
//  Created by Nima Abady on 2026-02-07.
//

import SwiftUI

struct HomeView: View {
    @State private var viewAllTasks = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea()

             

                VStack {
                    Spacer()
                    Text("Schedule")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                    
                    Image("CalendarImage")
                        .resizable()
                        .frame(width: 310, height: 300)
                        .aspectRatio(contentMode: .fit)
                        .padding(.bottom, 100)
                    
                    Spacer()
                    HStack {
                        Button(action: {
                            viewAllTasks = true
                        }) {
                            Image(systemName: "eye")
                                .foregroundColor(.white)
                                .font(.system(size: 40))
                                .padding()
                                .background(Color("ButtonColor"))
                                .clipShape(Circle())
                                .shadow(radius: 5)
                        }
                        .padding(.bottom, 30)
                        .padding(.leading, 20)
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
                        .padding(.bottom, 30)
                        .padding(.trailing, 20)
                    }
                }
            .navigationDestination(isPresented: $viewAllTasks) {ViewAllTasksView()}
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Home Screen")
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
    HomeView()
}
