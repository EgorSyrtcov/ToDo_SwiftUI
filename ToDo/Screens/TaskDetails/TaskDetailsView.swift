//
//  TaskDetailsView.swift
//  ToDo
//
//  Created by Egor Syrtcov on 6/16/21.
//

import SwiftUI

struct TaskDetailsView: View {
    
    @ObservedObject var viewModel: TaskDetailViewModel
    
    var body: some View {
        VStack(spacing: 30) {
            HStack {
                Image(systemName: viewModel.task.isCompleted ? "checkmark.circle" : "circle")
                    .frame(width: 30, height: 30)
                    .foregroundColor(viewModel.task.isCompleted ? .green : .red)
                Spacer()
                VStack(alignment: .trailing) {
                    Text("\(viewModel.task.title)")
                        .font(.title2)
                        .foregroundColor(Color.theme.accent)
                    Text("\(viewModel.task.description)")
                }
            }
            .padding()
            
            Button(action: {}, label: {
                Text("Delete")
                    .bold()
                    .frame(width: 280, height: 50)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            })
            Spacer()
        }
    }
}

struct TaskDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailsView(viewModel: ._preview)
    }
}
