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
            Image(systemName: "\(task.iconImageName)")
                .frame(width: 30, height: 30)
            Spacer()
            VStack(alignment: .trailing) {
                Text("\(task.title)")
                    .font(.headline)
                    .foregroundColor(Color.theme.accent)
                Text("\(task.description ?? "")")
            }
        }
        .padding(.horizontal)
    }
}

struct TaskViewCell_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            TaskViewCell(task: dev.mockTask)
                .previewLayout(.sizeThatFits)
            
            TaskViewCell(task: dev.mockTask)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
