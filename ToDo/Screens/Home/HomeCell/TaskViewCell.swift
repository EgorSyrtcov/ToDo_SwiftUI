//
//  TaskViewCell.swift
//  ToDo
//
//  Created by Egor Syrtcov on 6/3/21.
//

import SwiftUI

struct TaskViewCell: View {
    
    let task: TaskModel
    
    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.circle" : "circle")
                .frame(width: 30, height: 30)
                .foregroundColor(task.isCompleted ? .green : .red)
            Spacer()
            VStack(alignment: .trailing) {
                Text("\(task.title)")
                    .font(.title2)
                    .foregroundColor(Color.theme.accent)
                Text("\(task.description)")
            }
        }
        .padding(.vertical, 8)
    }
}

struct TaskViewCell_Previews: PreviewProvider {
    static var previews: some View {
        TaskViewCell(task: dev.mockTask)
            .previewLayout(.sizeThatFits)
    }
}
