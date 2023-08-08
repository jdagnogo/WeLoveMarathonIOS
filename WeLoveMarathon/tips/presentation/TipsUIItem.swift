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
            AsyncImage(url: URL(string: iconPath),scale: 5).frame(width: 30, height: 30)
                .foregroundColor(.white).padding(16)
            
            Text(name).foregroundColor(.white)
        }.onTapGesture {
            self.onClick()
        }
        .padding(.vertical, 16)
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
