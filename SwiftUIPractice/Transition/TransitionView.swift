//
//  TransitionView.swift
//  SwiftUIPractice
//
//  Created by 김성민 on 8/31/24.
//

import SwiftUI

struct TransitionView: View {
    
    @State private var isFull = false
    @State private var isSheet = false
    
    var body: some View {
        NavigationView {
            HStack(spacing: 20) {
                Button("Full") {
                    isFull.toggle()
                }
                Button("Sheet") {
                    isSheet = true
                }
                NavigationLink("Push") {
                    NetflixView()
                }
            }
            .sheet(isPresented: $isSheet, content: {
                NetflixView()
            })
            .fullScreenCover(isPresented: $isFull, content: {
                NetflixView()
            })
        }
    }
}

#Preview {
    TransitionView()
}
