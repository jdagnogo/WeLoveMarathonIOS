//
//  ContentView.swift
//  WeLoveMarathon
//
//  Created by Jean francois dagnogo on 10/07/2023.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case house
    case message
    case person
    case leaf
    case gearshape
}

struct WLMTabView: View {
    @Binding var selectedTab: Tab
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }

    
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    VStack{
                        Spacer()
                        Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
                            .scaleEffect(tab == selectedTab ? 1.25 : 1.0)
                            .foregroundColor(tab == selectedTab ?
                                             Color("Secondary"): Color("Primary"))
                            .frame(width: 40, height: 40)
                            .font(.system(size: 20))
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.1)) {
                                    selectedTab = tab
                                }
                            }
                        Text("\(tab.rawValue.capitalized)")
                            .foregroundColor(tab == selectedTab ?Color("Secondary"):Color("Primary"))
                        Spacer()
                    }
            
                
                }
            }
            .frame(width: nil, height: 80)
            .background(.white)
            .edgesIgnoringSafeArea(.bottom)
            .clipShape(
                        RoundCornerView(
                            cornerRadius: 20,
                            maskedCorners: [.topLeft, .topRight]
                        )
                    )
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        WLMTabView(selectedTab: .constant(.house))
    }
}
