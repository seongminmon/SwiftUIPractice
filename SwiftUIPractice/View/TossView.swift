//
//  TossView.swift
//  SwiftUIPractice
//
//  Created by 김성민 on 8/24/24.
//

import SwiftUI

struct HeaderButton: View {
    
    let imageName: String
    let text: String
    
    var body: some View {
        Button {
            print("\(text) 탭")
        } label: {
            VStack(spacing: 10) {
                Image(systemName: imageName)
                Text(text)
            }
        }
    }
}

struct TossView: View {
    
    @State var genre = "로맨스"
    
    private var titleText: some View {
        Text("포인트를 더 모을 수 있게 맞춤 혜택을 추천해드릴까요?")
            .asBoldWeight()
            .asForeground(.white)
            .padding()
    }
    
    private func descriptionView(_ imageName: String, _ text: String) -> some View {
        HStack {
            Image(systemName: imageName)
            Text(text)
            Spacer()
        }
    }
    
    private func genreButton(_ text: String) -> some View {
        Button(text) {
            genre = text
        }
    }
    
    var body: some View {
        ZStack {
            Color(.black)
            
            VStack {
                HStack(spacing: 80) {
                    HeaderButton(imageName: "star", text: "토스뱅크")
                    HeaderButton(imageName: "heart", text: "토스증권")
                    HeaderButton(imageName: "person", text: "고객센터")
                }
                .asBackground(.black)
                .padding()
                
                titleText

                VStack(spacing: 20) {
                    descriptionView("star", "매일 포인트 받는 출석체크/퀴즈")
                    descriptionView("heart", "새로운 이벤트")
                    descriptionView("person", "미션 추천")
                }
                .asForeground(.gray)
                
                Text("선택한 장르: \(genre)")
                    .padding()
                HStack(spacing: 30) {
                    genreButton("로맨스")
                    genreButton("액션")
                    genreButton("스릴러")
                }
                .asForeground(.blue)
                
                Spacer()
                
                HStack {
                    Text("[선택] 맞춤형 서비스 이용 동의")
                    Spacer()
                }
                .asForeground(.gray)
                .padding()
                
                Button {
                    print("동의하기 탭")
                } label: {
                    Text("동의하기")
                        .font(.title3)
                }
                .asRadiusBlueBackground()
                
                Button {
                    print("다음에 하기 탭")
                } label: {
                    Text("다음에 하기")
                }
                .asForeground(.gray)
            }
            .asForeground(.white)
            .padding(.vertical, 40)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    TossView()
}
