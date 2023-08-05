//
//  ContentView.swift
//  WeLoveMarathon
//
//  Created by Jean francois dagnogo on 10/07/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var tabSelected: Tab = .house
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
            VStack {
                TabView(selection: $tabSelected) {
                    HomeUIView()
                        .tabItem {Label("house", systemImage: "house")}
                        .tag(Tab.house)
                    
                    TipsUIView(viewModel: TipsViewModel(getTipsInteractor: GetTipsInteractorImpl(repository: TipsRepositoryProtocolImpl(service: TipsServiceImpl(), local: TipsLocalData()))))
                        .tabItem {Label("tips", systemImage: "house")}
                        .tag(Tab.message)
                }
                WLMTabView(selectedTab: $tabSelected)
            }.background(Color("Primary"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
