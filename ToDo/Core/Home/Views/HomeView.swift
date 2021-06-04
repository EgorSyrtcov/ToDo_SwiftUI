//
//  ContentView.swift
//  ToDo
//
//  Created by Egor Syrtcov on 5/31/21.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showDetailView: Bool = false
    
    @StateObject var vm = HomeViewModel()
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                homeHeader
                
                if !showDetailView {
                    allTaskList
                    .transition(.move(edge: .leading))
                }
                
                if showDetailView {
                    AddTaskView()
                    Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .navigationBarHidden(true)
        }
    }
}

extension HomeView {
    
    private var homeHeader: some View {
        HStack {
            CircleButtonView(iconName: showDetailView ? "plus" : "info")
                .animation(.none)
                .background(CircleButtonAnimationView(animate: $showDetailView))
            Spacer()
            Text(showDetailView ? "New TASK" : "ToDo List 💡")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .animation(.none)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showDetailView ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showDetailView.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    
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
