//
//  TipsUIItem.swift
//  WeLoveMarathon
//
//  Created by Jean francois dagnogo on 07/08/2023.
//

import SwiftUI

struct TipsUIItem: View {
    let color : String
    let iconPath : String
    let name : String
    var onClick : () -> ()
    var body: some View {
        VStack(alignment: .center) {
            Image(iconPath)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70, height: 70)
                .foregroundColor(.white)
            
            Text(name)
                .padding(.top, 6)
                .foregroundColor(.white)
        }.onTapGesture {
            self.onClick()
        }
        .padding(10)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 16)
    }
}

struct TipsUIItem_Previews: PreviewProvider {
    static var previews: some View {
        TipsUIItem(color: "", iconPath: "", name: "name", onClick: {})
    }
}
