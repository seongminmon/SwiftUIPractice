//
//  WalletView.swift
//  SwiftUIPractice
//
//  Created by 김성민 on 8/31/24.
//

import SwiftUI

struct Money: Hashable, Identifiable {
    enum Category: String {
        case one
        case two
        case three
    }
    
    let id = UUID()
    let price: Int = .random(in: 1000...10000)
    let product: String
    let category: Category
    
    var amountFormat: String {
        return price.formatted()
    }
}

struct WalletView: View {
    
    let dummy: [Money] = [
        Money(product: "asdf", category: .one),
        Money(product: "zxcv", category: .two),
        Money(product: "qwer", category: .three),
        Money(product: "ghjk", category: .one),
    ]
    
    @State private var banner = "23,456,467,700원"
    @State private var money: [Money] = []
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(1..<5) { data in
                                bannerView()
                                    .containerRelativeFrame(.horizontal)
                            }
                        }
                        .scrollTargetLayout()
                    }
                    .scrollTargetBehavior(.viewAligned)
                    .safeAreaPadding([.horizontal], 40)
                    LazyVStack {
                        ForEach(money, id: \.id) { data in
                            listView(data: data)
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
            .refreshable { // iOS15+
                banner = "34,532,130원"
                money = dummy.shuffled()
            }
            .onAppear {
                money = dummy.shuffled()
            }
            .navigationTitle("My Wallet")
        }
    }
    
    func bannerView() -> some View {
        ZStack {
            // 1. Rectangle
//            RoundedRectangle(cornerRadius: 25)
//                .fill(.gray)
//                .frame(maxWidth: .infinity)
//                .frame(height: 200)
            
            // 2. Overlay
            Rectangle()
                .fill(.gray)
                .overlay {
                    Circle()
                        .fill(.white.opacity(0.3))
                        .offset(x: -90, y: -20)
                        .scaleEffect(1.3, anchor: .topLeading)
                }
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .frame(height: 200)
            
            VStack(alignment: .leading) {
                Spacer()
                Text("나의 소비내역")
                    .font(.title3)
                Text(banner)
                    .font(.title)
                    .bold()
            }
            .visualEffect { content, geometryProxy in
                content.offset(x: scrollOffset(geometryProxy))
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
    }
    
    func scrollOffset(_ proxy: GeometryProxy) -> CGFloat {
        let result = proxy.bounds(of: .scrollView)?.minX ?? 0
        return -result
    }
    
    func listView(data: Money) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(data.product)
                Text(data.category.rawValue)
            }
            Spacer()
            Text(data.amountFormat)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 8)
    }
}

#Preview {
    WalletView()
}
