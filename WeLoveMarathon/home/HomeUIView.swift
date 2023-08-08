//
//  HomeView.swift
//  WeLoveMarathon
//
//  Created by Jean francois dagnogo on 18/07/2023.
//

import SwiftUI

struct HomeUIView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                ScrollView(.vertical) {
                    ScrollView(.vertical) {
                        let columns = Array(repeating: GridItem(.flexible(minimum: 100), spacing: 20), count: 2)
                        LazyVGrid(
                            columns: columns,
                            alignment: .center,
                            spacing: 16
                        ) {
                            ForEach(Activity.allCases, id: \.self) { item in
                                NavigationLink(
                                    destination: ShoppingUIView() // MARK: fix this
                                ) {
                                    ActivityUIView(model : item.getActivityDataModel())
                                }
                            }
                        }.padding()
                    }
                }
            }.background(Color("Primary")).navigationTitle("We Love Marathon")
        }
        .navigationDestination(for: Activity.self) { activity in
            switch activity {
            case .activity:ActivitiesUIView()
            case .beaches:ShoppingUIView()
            case .culture:ShoppingUIView()
            case .shopping:ShoppingUIView()
            case .foodDrink:ShoppingUIView()
            case .wine:ShoppingUIView()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeUIView()
    }
}
