//
//  CornerRadiusWrapper.swift
//  SwiftUIPractice
//
//  Created by 김성민 on 8/28/24.
//

import SwiftUI

private struct CornerRadiusWrapper: ViewModifier {
    
    let radius: CGFloat
    
    func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            content
                .clipShape(.rect(cornerRadius: radius))
        } else {
            content
                .cornerRadius(radius)
        }
    }
}

extension View {
    func asCornerRadius(_ radius: CGFloat) -> some View {
        modifier(CornerRadiusWrapper(radius: radius))
    }
}
