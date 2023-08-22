//
//  MyPassbookArea.swift
//  act6_kakaoBank
//
//  Created by Jay on 2023/08/21.
//

import SwiftUI

struct MyPassbookArea: View {
    @StateObject var navigationManager = NavigationManager.instance
    let account = TestUser.instance.userAccount //Account(userId: "1234", bank: "카카오", accountNumber: "3333-07-6239583", accountName: "김말티의 통장", amount: 500000000)
    
    var body: some View {
        VStack(spacing: 0){
            Text(account.accountNumber)
                .font(.pretendard(size: 15, .regular))
                .underline(color: Color.KakaoBlack200.opacity(0.5))
                .foregroundColor(Color.KakaoBlack200.opacity(0.5))
                .padding(.bottom, 10)
                
            Text("\(account.amount)원")
                .font(.pretendard(size: 35, .semiBold))
                .padding(.bottom, 48)
            
            HStack(spacing: 7) {
                Button {
                    navigationManager.path.append(StackViewType.transferView)
                } label: {
                    Text("이체하기")
                        .font(.pretendard(size: 14, .regular))
                        .padding(EdgeInsets(top: 18, leading: 52, bottom: 16, trailing: 52))
                        .background(Color.KakaoBlack200.opacity(0.06))
                        .cornerRadius(10)
                }
                Button {
                    navigationManager.path.append(StackViewType.loanView)
                } label: {
                    Text("대출받기")
                        .font(.pretendard(size: 14, .regular))
                        .padding(EdgeInsets(top: 18, leading: 52, bottom: 16, trailing: 52))
                        .background(Color.KakaoBlack200.opacity(0.06))
                        .cornerRadius(10)
                }
            }
            .foregroundColor(Color.KakaoBlack200)
        }
        .frame(maxWidth: .infinity)
        .padding(EdgeInsets(top: 40, leading: 40, bottom: 36, trailing: 40))
        .background(Color.kakaoYellow)
    }
}

struct MyPassbookArea_Previews: PreviewProvider {
    static var previews: some View {
        MyPassbookArea()
    }
}
