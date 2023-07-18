//
//  RoundCornerView.swift
//  WeLoveMarathon
//
//  Created by Jean francois dagnogo on 18/07/2023.
//

import SwiftUI


struct RoundCornerView: Shape {
    
    // MARK: - PROPERTIES
    
    var cornerRadius: CGFloat
    var maskedCorners: UIRectCorner
    
    
    // MARK: - PATH
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: maskedCorners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        return Path(path.cgPath)
    }
}

// MARK: - PREVIEW

struct RoundCorner_Previews: PreviewProvider {
    static var previews: some View {
        RoundCornerView(cornerRadius: 20, maskedCorners: .allCorners)
    }
}
