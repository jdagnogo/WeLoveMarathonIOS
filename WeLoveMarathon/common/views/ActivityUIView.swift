//
//  ActivityUIView.swift
//  WeLoveMarathon
//
//  Created by Jean francois dagnogo on 19/07/2023.
//

import SwiftUI

struct ActivityUIView: View {    
    let model : ActivityDataModel
    
    var body: some View {
        VStack(alignment: .center) {
            Image(model.iconPath)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70, height: 70)
                .foregroundColor(.white)
            
            Text(model.name)
                .padding(.top, 6)
                .foregroundColor(.white)
        }.padding(10)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(model.color)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 16)
    }
}

//Data class that describe the view
struct ActivityDataModel{
    var color : Color
    var name : String
    var iconPath : String
    
    init(color: Color, name: String, iconPath: String) {
        self.color = color
        self.name = name
        self.iconPath = iconPath
    }
}

struct ActivityUIView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityUIView(model : Activity.wine.getActivityDataModel())
    }
}
