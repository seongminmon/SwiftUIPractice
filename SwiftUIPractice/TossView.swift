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

private struct RadiusBlueBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: 50)
            .foregroundStyle(.white)
            .background(.blue)
            .clipShape(.capsule)
    }
}

extension View {
    func asRadiusBlueBackground() -> some View {
        return self
            .modifier(RadiusBlueBackground())
    }
}

struct TossView: View {
    
    private var titleText: some View {
        Text("포인트를 더 모을 수 있게 맞춤 혜택을 추천해드릴까요?")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .padding()
    }
    
    private func descriptionView(_ imageName: String, _ text: String) -> some View {
        HStack {
            Image(systemName: imageName)
            Text(text)
            Spacer()
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
                .foregroundStyle(.white)
                .background(.black)
                .padding()
                
                titleText

                VStack(spacing: 20) {
                    descriptionView("star", "매일 포인트 받는 출석체크/퀴즈")
                    descriptionView("heart", "새로운 이벤트")
                    descriptionView("person", "미션 추천")
                }
                .foregroundStyle(.gray)
                
                Spacer()
                
                HStack {
                    Text("[선택] 맞춤형 서비스 이용 동의")
                    Spacer()
                }
                .foregroundStyle(.gray)
                .padding()
                
                Button {
                    print("동의하기 탭")
                } label: {
                    Text("동의하기")
                }
                .asRadiusBlueBackground()
                
                Button {
                    print("다음에 하기 탭")
                } label: {
                    Text("다음에 하기")
                }
                .foregroundStyle(.gray)
            }
            .padding(EdgeInsets(top: 60, leading: 0, bottom: 40, trailing: 0))
        }
        .ignoresSafeArea()
       
    }
}

#Preview {
    TossView()
}
