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
                Grid {
                    GridRow {
                        ActivityUIView(model : Activity.activity.getActivityDataModel()).padding(5)
                        ActivityUIView(model : Activity.beaches.getActivityDataModel()).padding(5)
                    }
                    GridRow {
                        ActivityUIView(model : Activity.culture.getActivityDataModel()).padding(5)
                        ActivityUIView(model : Activity.shopping.getActivityDataModel()).padding(5)
                    }
                    GridRow {
                        ActivityUIView(model : Activity.foodDrink.getActivityDataModel()).padding(5)
                        ActivityUIView(model : Activity.wine.getActivityDataModel()).padding(5)
                    }
                }.padding()
                
            }.background(Color("Primary"))
                .navigationTitle("We Love MArathon")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeUIView()
    }
}
