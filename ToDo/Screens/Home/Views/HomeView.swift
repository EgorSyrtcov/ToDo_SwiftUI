//
//  ContentView.swift
//  ToDo
//
//  Created by Egor Syrtcov on 5/31/21.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject private var viewModel: HomeViewViewModel
    
    init(viewModel: HomeViewViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
            ZStack {
                if viewModel.items.isEmpty {
                    NoTasksView()
                } else {
                    allTaskList
                }
            }
            .navigationBarTitle("ToDo List 💡")
            .navigationBarItems(
                leading: EditButton(),
                trailing: NavigationLink(
                    destination: AddTaskView(), label: {
                        CircleButtonView(iconName: "plus")
                    }))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: ._preview) 
    }
}

extension HomeView {
    
    private var allTaskList: some View {
        List {
            ForEach(viewModel.items) { (item) in
                TaskViewCell(task: item)
            }
        }
        .listStyle(PlainListStyle())
    }
}
