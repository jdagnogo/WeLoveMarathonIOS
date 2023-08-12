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
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]

    }
    var body: some View {
            VStack {
                TabView(selection: $tabSelected) {
                    HomeUIView()
                        .tabItem {Label("house", systemImage: "house")}
                        .tag(Tab.house)
                    
                    TipsUIView(viewModel: TipsViewModel(getTipsInteractor: GetTipsInteractorImpl(repository: TipsRepositoryProtocolImpl(service: TipsServiceImpl(), local: TipsLocalData(), dataFreshnessRepository: DataFreshnessRepositoryImpl()))))
                        .tabItem {Label("tips", systemImage: "house")}
                        .tag(Tab.message)
                    
                    FavsUiView(onNavigateToHome: {tabSelected = .house}).tag(Tab.person)
                    
                    RunUIView().tag(Tab.leaf)
                    
                    AboutUIView(viewModel: AboutViewModel(getAboutInteractor: GetAboutInteractorImpl(repository: AboutRepositoryProtocolImpl(service: AboutServiceImpl(), local: AboutLocalData(), dataFreshnessRepository: DataFreshnessRepositoryImpl())))).tag(Tab.gearshape)
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
