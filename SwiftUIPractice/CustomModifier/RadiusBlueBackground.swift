//
//  RadiusBlueBackground.swift
//  SwiftUIPractice
//
//  Created by 김성민 on 8/28/24.
//

import SwiftUI

private struct RadiusBlueBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .asBoldWeight()
            .frame(maxWidth: .infinity, maxHeight: 50)
            .asForeground(.white)
            .asBackground(.blue)
            .clipShape(.capsule)
    }
}

extension View {
    func asRadiusBlueBackground() -> some View {
        return self
            .modifier(RadiusBlueBackground())
    }
}


