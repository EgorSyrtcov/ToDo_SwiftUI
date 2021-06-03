//
//  ContentView.swift
//  ToDo
//
//  Created by Egor Syrtcov on 5/31/21.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showDetailView: Bool = false
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                homeHeader
                Spacer(minLength: 0)
                
                List {
                    TaskViewCell(task: DeveloperPriview.shared.mockTask)
                }
                .listStyle(PlainListStyle())
            }
        }
        .environmentObject(vm)
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
}
