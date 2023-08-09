//
//  FavsUiView.swift
//  WeLoveMarathon
//
//  Created by Jean francois dagnogo on 08/08/2023.
//

import SwiftUI

struct FavsUiView: View {
    var onNavigateToHome : () -> ()
    var body: some View {
        ScrollView {
            ScrollView(.vertical) {
                EmptyFavsUiView(onClick: {onNavigateToHome()})
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding()
        } .frame(maxWidth: .infinity, maxHeight: .infinity).background(Color("Primary"))
    }
}

struct FavsUiView_Previews: PreviewProvider {
    static var previews: some View {
        FavsUiView(onNavigateToHome: {})
    }
}
