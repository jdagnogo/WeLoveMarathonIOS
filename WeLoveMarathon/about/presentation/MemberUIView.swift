//
//  MemberUIView.swift
//  WeLoveMarathon
//
//  Created by Jean francois dagnogo on 14/08/2023.
//

import SwiftUI

struct MemberUIView: View {
    let member : MemberModel
    var body: some View {
        VStack(alignment: .center){
            AsyncImage(url: URL(string: member.icon)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.white, lineWidth: 1)
                    }
                    .shadow(radius: 7)
                    .padding(.bottom ,8)
                } placeholder: {
                    ProgressView()
                }
            
            Text(member.name)
                .foregroundColor(Color.blue)
                .font(.system(size: 12))
        }
    }
}

struct MemberUIView_Previews: PreviewProvider {
    static var previews: some View {
        MemberUIView(member: MemberModel())
    }
}
