import SwiftUI
import SwiftData

struct HomeView: View {
    @Query var tasks: [Task]
    
    @State private var selectedDates: Set<DateComponents> = []
    @State private var shouldNavigate = false
    
    @State private var isUpdating = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea()

                VStack(spacing: 20) {
                    Text("Schedule")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.top)

                    MultiDatePicker("Upcoming Tasks", selection: $selectedDates)
                        .datePickerStyle(.graphical)
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(15)
                        .colorInvert()
                        .colorMultiply(.white)
                        .padding(.horizontal)
                        .onChange(of: selectedDates) { oldValue, newValue in
                            guard !isUpdating else { return }
                            
                            let diffused = newValue.subtracting(oldValue)
                            if let newlyTapped = diffused.first {
                                if hasTask(on: newlyTapped) {
                                    shouldNavigate = true
                                }
                                updateHighlights()
                            }
                        }

                    Spacer()
                    
                    HStack {
                        NavigationLink(destination: ViewAllTasksView()) {
                            Image(systemName: "eye")
                                .foregroundColor(.white)
                                .font(.system(size: 30))
                                .padding()
                                .background(Color("ButtonColor"))
                                .clipShape(Circle())
                                .shadow(radius: 5)
                        }
                        .padding(.leading, 20)

                        Spacer()

                        NavigationLink(destination: AddTasksView()){
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .font(.system(size: 30))
                                .padding()
                                .background(Color("ButtonColor"))
                                .clipShape(Circle())
                                .shadow(radius: 5)
                        }
                        .padding(.trailing, 20)
                    }
                    .padding(.bottom, 30)
                }
            }
            .navigationDestination(isPresented: $shouldNavigate) {
                ViewAllTasksView()
            }
            .onAppear {
                updateHighlights()
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

    private func updateHighlights() {
        isUpdating = true
        
        let calendar = Calendar.current
        let components = tasks.map { task in
            calendar.dateComponents([.calendar, .era, .year, .month, .day], from: task.dueDate)
        }
        selectedDates = Set(components)
        
        //needed a small buffer otherwise would load nav as the part above was rendering
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            isUpdating = false
        }
    }

    private func hasTask(on components: DateComponents) -> Bool {
        let calendar = Calendar.current
        guard let date = calendar.date(from: components) else { return false }
        
        return tasks.contains { task in
            calendar.isDate(task.dueDate, inSameDayAs: date)
        }
    }
}
