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
            allTaskList
                .navigationBarTitle("ToDo List 💡")
                .navigationBarItems(trailing:
                                        Button(action: {
                                            print("Add new task")
                                        }) {
                                            CircleButtonView(iconName: "plus")
                                        })
        }
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
            .onDelete(perform: vm.deleteTask )
        }
        .listStyle(PlainListStyle())
    }
}
