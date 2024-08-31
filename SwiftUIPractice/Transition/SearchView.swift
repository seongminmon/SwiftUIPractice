//
//  SearchView.swift
//  SwiftUIPractice
//
//  Created by 김성민 on 8/31/24.
//

import SwiftUI

struct Movie: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let color = Color.random()
}

extension Color {
    static func random() -> Color {
        return Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
    }
}

struct SearchView: View {
    
    @State private var searchQuery = ""
    
    let movie = [
        Movie(name: "어벤져스"),
        Movie(name: "어벤져스2"),
        Movie(name: "어벤져스3"),
        Movie(name: "엑스맨"),
        Movie(name: "해리포터2"),
        Movie(name: "해리포터3"),
        Movie(name: "A"),
        Movie(name: "AB"),
    ]
    
    var filterMovie: [Movie] {
        return searchQuery.isEmpty ? movie : movie.filter { $0.name.contains(searchQuery) }
    }
    
    var body: some View {
        // 1. 네비게이션 뷰
//        NavigationView {
//            List {
//                ForEach(filterMovie, id: \.self) { item in
//                    NavigationLink {
//                        SearchDetailView(movie: item)
//                    } label: {
//                        HStack {
//                            Circle().asForeground(item.color)
//                            Text(item.name)
//                        }
//                        .frame(height: 60)
//                    }
//                }
//            }
//            .navigationTitle("검색")
//            .searchable(text: $searchQuery, placement: .navigationBarDrawer, prompt: "검색해보세요")
//            .onSubmit(of: .search) {
//                print("리턴키 확인")
//            }
//        }
        
        // 2. 네비게이션 스택
        NavigationStack {
            List {
                ForEach(filterMovie, id: \.self) { item in
                    NavigationLink(value: item) {
                        HStack {
                            Circle().asForeground(item.color)
                            Text(item.name)
                        }
                        .frame(height: 60)
                    }
                }
            }
            
            .navigationTitle("검색")
            .navigationDestination(for: Movie.self) { item in
                SearchDetailView(movie: item)
            }
            .searchable(text: $searchQuery, placement: .navigationBarDrawer, prompt: "검색해보세요")
            .onSubmit(of: .search) {
                print("리턴키 확인")
            }
        }
    }
}

struct SearchDetailView: View {
    
    var movie: Movie
    
    var body: some View {
        Text("\(movie.name)")
    }
}

#Preview {
    SearchView()
}
