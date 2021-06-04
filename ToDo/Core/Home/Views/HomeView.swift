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
    
    @State private var newTask: String = ""
    @State private var newDiscription: String = ""
    
    
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
                    addTaskView
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
                .onTapGesture {
                    if showDetailView {
                        print(newTask)
                    }
                }
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
    
    private var addTaskView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)))
            
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
        .frame(width: 360, height: 300)
    }
}
