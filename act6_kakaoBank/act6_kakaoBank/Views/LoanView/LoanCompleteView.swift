//
//  LoanCompleteView.swift
//  act6_kakaoBank
//
//  Created by Jay on 2023/08/21.
//

import SwiftUI

struct LoanCompleteView: View {
    @StateObject var navigationManager = NavigationManager.instance
    let elonMusk = User(name: "일론머스크", imgString: "musk")
    let loanAmount: Int
    var body: some View {
        VStack{
            Image(systemName: "checkmark")
                .font(.system(size: 26))
                .frame(width: 55, height: 55)
                .background(Color.kakaoYellow)
                .cornerRadius(50)
            Text("\(elonMusk.name)님이")
                .font(.pretendard(size: 24, .semiBold))
                .foregroundColor(Color.KakaoBlack200)
            Text("\(loanAmount)원")
                .font(.pretendard(size: 24, .bold))
                .foregroundColor(Color.kakaoBlue300)
            + Text(" 보냈어요")
                .font(.pretendard(size: 24, .semiBold))
                .foregroundColor(Color.KakaoBlack200)
            
            Spacer()
            
            Button{
                navigationManager.path = .init()
            } label: {
                Text("확인")
                    .font(.pretendard(size: 16, .regular))
                    .foregroundColor(Color.KakaoBlack200)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(Color.kakaoYellow)
                    .cornerRadius(10)
            }
        }
        .padding(EdgeInsets(top: 240, leading: 16, bottom: 34, trailing: 16))
//        .ignoresSafeArea()
    }
}

struct LoanCompleteView_Previews: PreviewProvider {
    static var previews: some View {
        LoanCompleteView(loanAmount: 50000)
    }
}
