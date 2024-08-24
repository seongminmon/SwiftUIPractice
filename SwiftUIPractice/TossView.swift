//
//  TossView.swift
//  SwiftUIPractice
//
//  Created by 김성민 on 8/24/24.
//

import SwiftUI

struct TossView: View {
    
    var body: some View {
        ZStack {
            Color(.black)
            
            VStack {
                HStack(spacing: 80) {
                    Button {
                        print("1")
                    } label: {
                        VStack(spacing: 10) {
                            Image(systemName: "star")
                            Text("토스뱅크")
                        }
                    }
                    
                    Button {
                        print("2")
                    } label: {
                        VStack(spacing: 10) {
                            Image(systemName: "star")
                            Text("토스증권")
                        }
                    }
                    
                    Button {
                        print("3")
                    } label: {
                        VStack(spacing: 10) {
                            Image(systemName: "star")
                            Text("고객센터")
                        }
                    }
                }
                .foregroundStyle(.white)
                .background(.black)
                .padding()
                
                Text("포인트를 더 모을 수 있게 맞춤 혜택을 추천해드릴까요?")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .padding()

                VStack(spacing: 20) {
                    HStack {
                        Image(systemName: "star")
                        Text("매일 포인트 받는 출석체크/퀴즈")
                        Spacer()
                    }
                    HStack {
                        Image(systemName: "star")
                        Text("새로운 이벤트")
                        Spacer()
                    }
                    HStack {
                        Image(systemName: "star")
                        Text("미션 추천")
                        Spacer()
                    }
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
                .frame(width: 350, height: 50)
                .foregroundStyle(.white)
                .background(.blue)
                .cornerRadius(10)
                
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
