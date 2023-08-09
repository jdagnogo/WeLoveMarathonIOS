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
    
    func getName() -> String {
        switch self {
        case .house: return  "Home"
        case .message: return  "Tips"
        case .person: return  "Favs"
        case .leaf: return  "Run"
        case .gearshape: return  "About"
        }
    }
}

struct WLMTabView: View {
    @Binding var selectedTab: Tab
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    
    
    var body: some View {
        HStack(spacing:30) {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                let color = tab == selectedTab ?Color("Secondary"): Color("Primary")
                VStack{
                    Spacer()
                    Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
                        .scaleEffect(tab == selectedTab ? 1.25 : 1.0)
                        .foregroundColor(Color.white)
                        .frame(width: 40, height: 40)
                        .font(.system(size: 20))
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.1)) {
                                selectedTab = tab
                            }
                        }
                        .background( Circle().foregroundColor(color))
                    Text(tab.getName())
                        .foregroundColor(color)
                        .font(.system(size: 16))
                    Spacer()
                }
            }
        }
        .frame(width: nil, height: 100)
        .frame(maxWidth: .infinity)
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

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        WLMTabView(selectedTab: .constant(.house))
    }
}
