//
//  BoldWeightWrapper.swift
//  SwiftUIPractice
//
//  Created by 김성민 on 8/28/24.
//

import SwiftUI

private struct BoldWeightWrapper: ViewModifier {
    
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content
                .font(.title)
                .fontWeight(.bold)
        } else {
            content
                .font(.system(size: 32, weight: .bold))
        }
    }
}

extension View {
    func asBoldWeight() -> some View {
        modifier(BoldWeightWrapper())
    }
}
