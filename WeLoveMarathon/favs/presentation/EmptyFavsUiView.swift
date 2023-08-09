//
//  EmptyFavsUiView.swift
//  WeLoveMarathon
//
//  Created by Jean francois dagnogo on 09/08/2023.
//

import SwiftUI

struct EmptyFavsUiView: View {
    var onClick : () -> ()
    var body: some View {
        Spacer()
        Image(systemName: "heart")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 250, height: 250)
            .foregroundColor(Color("Secondary"))
            .padding(.vertical ,40)
        
        Text("Nothing added as favorites yet")
            .foregroundColor(Color.white)
            .bold()
            .font(.system(size: 20))
            .padding(.bottom , 8)
        
        Text("You can add them from each category of the home page")
            .foregroundColor(Color.white)
            .font(.system(size: 16))
            .multilineTextAlignment(.center)
            .padding(.bottom , 20)
        
        Button(action: {
            onClick()
        }) {
            Text("Go to categories")
                .foregroundColor(Color("Primary"))
                .padding(8)
                .background(Color("Secondary"))
                .cornerRadius(20)
        }
        Spacer()
    }
}

struct EmptyFavsUiView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyFavsUiView(onClick: {})
    }
}
