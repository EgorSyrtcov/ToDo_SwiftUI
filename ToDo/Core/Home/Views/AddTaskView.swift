//
//  AddTaskView.swift
//  ToDo
//
//  Created by Egor Syrtcov on 6/4/21.
//

import SwiftUI

struct AddTaskView: View {
    
    @State private var newTask: String = ""
    @State private var newDiscription: String = ""

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
        }
        .padding()
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}
