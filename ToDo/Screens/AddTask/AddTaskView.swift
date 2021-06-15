//
//  AddTaskView.swift
//  ToDo
//
//  Created by Egor Syrtcov on 6/4/21.
//

import SwiftUI

struct AddTaskView: View {
    
    @ObservedObject private var viewModel: AddTaskViewModel
    
    @State private var newTask: String = ""
    @State private var newDiscription: String = ""
    
    @State var showsAlert = false
    @State var alertTitle: String = ""
    
    
    init(viewModel: AddTaskViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(spacing: 25) {
            Text("Enter your new TASK")
                .font(.largeTitle)
            TextField("Title task", text: $newTask)
                .padding()
                .frame(height: 55)
                .background(Color(#colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)))
                .foregroundColor(.red)
                .cornerRadius(10)
            
            
            TextField("Discription", text: $newDiscription)
                .padding()
                .frame(height: 55)
                .background(Color(#colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)))
                .foregroundColor(.red)
                .cornerRadius(10)
            
            Button(action: saveButtonPresenter, label: {
                        Text("SAVE")
                            .bold()
                            .frame(width: 280, height: 50)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    })
        }
        .offset(y: -60)
//        .alert(isPresented: $showsAlert, content: getAlert)
    }
    
    func textIsAppropriate() -> Bool {
        if newTask.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters long!!!😨😰😱"
            showsAlert.toggle()
            return false
        }
        return true
    }
    
    func saveButtonPresenter() {
//        if textIsAppropriate() {
//
//            let task = TaskModel(title: newTask,
//                                 description: newDiscription,
//                                 isCompleted: false)
//            vm.addToDo(task)
//            presentationMode.wrappedValue.dismiss()
//        }
    }
    
//    func getAlert() -> Alert {
//        Alert(title: Text(alertTitle))
//    }
}

//struct AddTaskView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddTaskView(vm: ._preview)
//    }
//}
