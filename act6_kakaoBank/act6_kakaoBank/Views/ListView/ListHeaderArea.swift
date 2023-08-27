//
//  ListHeaderArea.swift
//  act6_kakaoBank
//
//  Created by Jay on 2023/08/23.
//

import SwiftUI

struct ListHeaderArea: View {
    @StateObject var navigationManager = NavigationManager.instance
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(){
                Spacer()
                Button{
                    navigationManager.path.removeLast()
                } label: {
                    Text("닫기")
                        .font(.pretendard(size: 15, .regular))
                        .foregroundColor(Color.KakaoBlack200)
                }
            }
            .padding(EdgeInsets(top: 64, leading: 0, bottom: 10, trailing: 15))
            
            HStack{
                Text("이체")
                    .font(.pretendard(size: 22, .semiBold))
                    .foregroundColor(Color.KakaoBlack200)
                Spacer()
            }
            .padding(20)
        }
        .ignoresSafeArea()
    }
}

struct ListHeaderArea_Previews: PreviewProvider {
    static var previews: some View {
        ListHeaderArea()
    }
}
