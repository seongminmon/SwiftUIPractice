//
//  WalletView.swift
//  SwiftUIPractice
//
//  Created by 김성민 on 8/31/24.
//

import SwiftUI

struct Market: Hashable, Codable {
    let market: String
    let korean: String
    let english: String
    
    enum CodingKeys: String, CodingKey {
        case market
        case korean = "korean_name"
        case english = "english_name"
    }
}

struct UpbitAPI {
    private init() {}
    
    static func fetchAllMarket(completion: @escaping ([Market]) -> Void) {
        let url = URL(string: "https://api.upbit.com/v1/market/all")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("데이터 응답 없음")
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode([Market].self, from: data)
                
                DispatchQueue.main.async {
                    completion(decodedData)
                }
            } catch {
                print("디코딩 에러: \(error)")
            }
        }
        .resume()
    }
}

struct WalletView: View {
    
    @State private var banner = "11,111,111,111원"
    @State private var money: [Market] = []
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(0..<5) { data in
                                bannerView()
                                    .containerRelativeFrame(.horizontal)
                            }
                        }
                        .scrollTargetLayout()
                    }
                    .scrollTargetBehavior(.viewAligned)
                    .safeAreaPadding([.horizontal], 40)
                    LazyVStack {
                        ForEach(money, id: \.self) { data in
                            listView(data: data)
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
            .refreshable { // iOS15+
                banner = "22,222,222,222원"
                UpbitAPI.fetchAllMarket { market in
                    money = market
                }
            }
            .onAppear {
                UpbitAPI.fetchAllMarket { market in
                    money = market
                }
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
    
    func listView(data: Market) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(data.korean)
                Text(data.english)
            }
            Spacer()
            Text(data.market)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 8)
    }
}

#Preview {
    WalletView()
}
