//
//  toggleTintWrapper.swift
//  SwiftUIPractice
//
//  Created by 김성민 on 8/28/24.
//

import SwiftUI

private struct toggleTintWrapper: ViewModifier {
    
    let color: Color
    
    func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            content
                .tint(.red)
        } else {
            content
                .toggleStyle(SwitchToggleStyle(tint: .red))
        }
    }
}

extension View {
    func asTint(_ color: Color) -> some View {
        modifier(toggleTintWrapper(color: color))
    }
}
