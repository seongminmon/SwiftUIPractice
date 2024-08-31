//
//  NetflixView.swift
//  SwiftUIPractice
//
//  Created by 김성민 on 8/28/24.
//

import SwiftUI

struct NetflixView: View {
    
    @State private var title = "JACKFLIX"
    @State private var isOn = false
    @State private var titleList = [
        "이메일 주소 또는 전화번호",
        "비밀번호",
        "닉네임",
        "위치",
        "추천 코드 입력"
    ]
    
    func descriptionView(_ text: String) -> some View {
        Text(text)
            .frame(maxWidth: .infinity, minHeight: 44)
            .asForeground(.white)
            .asBackground(.gray)
            .asCornerRadius(10)
            .padding(.horizontal, 20)
    }
    
    var body: some View {
        Text(title)
            .asBoldWeight()
            .asForeground(.red)
            .padding()
        
        Spacer()
        
        ForEach(titleList, id: \.self) { item in
            descriptionView(item)
        }
        
        SignUpButton(title: $title, titleList: $titleList)
        
        Toggle("추가 정보 입력", isOn: $isOn)
            .asTint(.red)
            .padding(.horizontal, 20)
        
        Spacer()
    }
}

#Preview {
    NetflixView()
}

struct SignUpButton: View {
    
    @Binding var title: String
    @Binding var titleList: [String]
    
    var body: some View {
        Text("회원가입")
            .frame(maxWidth: .infinity, minHeight: 44)
            .asForeground(.white)
            .asBackground(.blue)
            .asCornerRadius(10)
            .padding(.horizontal, 20)
            .wrapToButton {
                print("회원가입 탭")
                while true {
                    let randomTitle = titleList.randomElement()
                    if randomTitle != title {
                        title = randomTitle ?? "JACKFLIX"
                        break
                    }
                }
            }
    }
}
