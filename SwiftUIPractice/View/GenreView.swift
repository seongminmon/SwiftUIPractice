//
//  GenreView.swift
//  SwiftUIPractice
//
//  Created by 김성민 on 8/28/24.
//

import SwiftUI

struct Genre: Hashable, Identifiable {
    let id = UUID()
    let title: String
    let number: Int
}

struct GenreView: View {
    
    @State private var list: [Genre] = [
        Genre(title: "스릴러", number: 4),
        Genre(title: "SF", number: 64),
        Genre(title: "액션", number: 10),
        Genre(title: "액션", number: 10),
        Genre(title: "로맨스", number: 34)
    ]
    @State private var text = ""
    
    var body: some View {
        TextField("장르를 입력해주세요", text: $text)
            .padding()
        
        Button("추가하기") {
            if !text.isEmpty {
                let item = Genre(title: text, number: .random(in: 1...10))
                list.append(item)
            }
        }
        .padding()
        .asForeground(.white)
        .asBackground(.gray)
        
        ListView(list: $list)
    }
}

struct ListView: View {
    
    @Binding var list: [Genre]
    
    var body: some View {
        List(list, id: \.id) { item in
            Text("\(item.title)-\(item.number)")
        }
    }
}

#Preview {
    GenreView()
}
