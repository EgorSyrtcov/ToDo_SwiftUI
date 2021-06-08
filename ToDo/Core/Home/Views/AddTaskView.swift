//
//  AddTaskView.swift
//  ToDo
//
//  Created by Egor Syrtcov on 6/4/21.
//

import SwiftUI

struct AddTaskView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var newTask: String = ""
    @State private var newDiscription: String = ""
    @State var showsAlert = false
    
    @EnvironmentObject var vm: HomeViewModel
    
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
            
            Button(action: {
                    
                    if newTask == "" || newDiscription == "" {
                        showsAlert = true
                        return
                    }
                    
                    let task = TaskModel(title: newTask, description: newDiscription, isCompleted: false)
                    vm.addToDo(task)
                    presentationMode.wrappedValue.dismiss() }, label: {
                        Text("SAVE")
                            .bold()
                            .frame(width: 280, height: 50)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .alert(isPresented: $showsAlert, content: {
                                Alert(title: Text("Enter your title and description"))
                            })
                    })
        }
        .offset(y: -60)
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}
