//
//  HomeView.swift
//  WeLoveMarathon
//
//  Created by Jean francois dagnogo on 18/07/2023.
//

import SwiftUI

struct HomeUIView: View {
    var body: some View {
        VStack{
            Text("Hello, from home!")
        } .frame(maxWidth: .infinity, maxHeight: .infinity).background(Color("Primary"))
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeUIView()
    }
}
