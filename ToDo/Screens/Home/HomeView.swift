//
//  ContentView.swift
//  ToDo
//
//  Created by Egor Syrtcov on 5/31/21.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject private var viewModel: HomeViewViewModel
    @State private var animate = false
    
    init(viewModel: HomeViewViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            if viewModel.items.isEmpty {
                noTasksView
            } else {
                allTaskList
            }
        }
        .navigationBarTitle("ToDo List 💡")
        .navigationBarItems(
            trailing: Button("Add", action: {
                viewModel.addItemAction()
            })
        )
        .onAppear {
            viewModel.becomeActive()
        }
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
                Button(action: {
                    viewModel.itemDetailsAction(item)
                }, label: {
                    TaskViewCell(task: item)
                })
            }
        }
        .listStyle(PlainListStyle())
    }
}

extension HomeView {
    
    var noTasksView: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Button(action: {
                    viewModel.addItemAction()
                }, label: {
                    Text("Add Something 🤔")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color.red : Color.blue)
                        .cornerRadius(10)
                })
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(color: animate ? Color.red.opacity(0.7) : Color.blue.opacity(0.7),
                        radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 50 : 30)
                .scaleEffect(animate ? 1.1 : 1.0)
            }
            .padding(60)
            
        }
        .onAppear(perform: addAnimation)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
    }
    
    private func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}
