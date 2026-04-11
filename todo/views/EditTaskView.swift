import SwiftUI
import SwiftData

struct EditTaskView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    let task: Task
    
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var taskType: String = ""
    @State private var dueDate: Date = Date()
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text("Title")
                        .foregroundColor(.white)
                        .bold()
                    
                    TextField("Title", text: $title)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .padding(.bottom, 5) 
                    
                    Text("Description")
                        .foregroundColor(.white)
                        .bold()
                    
                    TextField("Description", text: $description)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .padding(.bottom, 5)
                    
                    Text("Task Type")
                        .foregroundColor(.white)
                        .bold()
                    
                    TextField("Task Type", text: $taskType)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .padding(.bottom, 5)
                    
                    Text("Due Date")
                        .foregroundColor(.white)
                        .bold()
                    
                    DatePicker("", selection: $dueDate, displayedComponents: .date)
                        .labelsHidden()
                        .datePickerStyle(.graphical)
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(10)
                        .colorInvert()
                        .colorMultiply(.white)
                    
                    Button(action: saveTask) {
                        HStack {
                            Spacer()
                            Text("Save Changes")
                                .foregroundColor(.white)
                                .bold()
                            Spacer()
                        }
                        .padding()
                        .background(Color("ButtonColor"))
                        .cornerRadius(10)
                    }
                    .padding(.top, 20)
                }
                .padding()
            }
        }
        .onAppear {
            self.title = task.title
            self.description = task.descriptions
            self.taskType = task.taskType
            self.dueDate = task.dueDate
        }
        .navigationBarTitle("Edit Task", displayMode: .inline)
    }
    
    private func saveTask() {
        task.title = title
        task.descriptions = description
        task.taskType = taskType
        task.dueDate = dueDate
        
        dismiss()
    }
}
