//
//  AddTaskView.swift
//  ToDo
//
//  Created by Egor Syrtcov on 6/3/21.
//

import SwiftUI

struct AddTaskView: View {
    
    @State private var newTask: String = ""
    @State private var newDiscription: String = ""
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)))
            
            VStack(spacing: 25) {
                Text("Enter your new TASK")
                    .font(.largeTitle)
                TextField("Title task", text: $newTask)
                    .frame(height: 55)
                    .background(Color(#colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)))
                    .cornerRadius(10)
                
                TextField("Discription", text: $newDiscription)
                    .frame(height: 55)
                    .background(Color(#colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)))
                    .cornerRadius(10)
            }
            .padding()
        }
        .frame(width: 360, height: 300)
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddTaskView()
        }
    }
}
