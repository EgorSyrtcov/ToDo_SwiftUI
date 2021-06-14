//
//  ContentView.swift
//  ToDo
//
//  Created by Egor Syrtcov on 5/31/21.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var vm = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                if vm.taskLists.isEmpty {
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
        .environmentObject(vm)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

extension HomeView {
    
    private var allTaskList: some View {
        List {
            ForEach(vm.taskLists) { (item) in
                TaskViewCell(task: item)
            }
        }
        .listStyle(PlainListStyle())
    }
}
