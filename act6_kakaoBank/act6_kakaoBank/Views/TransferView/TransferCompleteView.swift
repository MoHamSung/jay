//
//  TransferCompleteView.swift
//  act6_kakaoBank
//
//  Created by Jay on 2023/08/27.
//

import SwiftUI

struct TransferCompleteView: View {
    @StateObject var navigationManager = NavigationManager.instance
    let transferAmount: Int
    let listItem: ListItem
    
    var body: some View {
        VStack(spacing: 3) {
            Image(systemName: "checkmark")
                .font(.system(size: 26))
                .frame(width: 55, height: 55)
                .background(Color.kakaoYellow)
                .cornerRadius(50)
            Text("\(listItem.user.name)님에게")
                .font(.pretendard(size: 24, .semiBold))
                .foregroundColor(Color.KakaoBlack200)
                .padding(.top, 32)
            Text("\(transferAmount)원")
                .font(.pretendard(size: 24, .bold))
                .foregroundColor(Color.kakaoBlue300)
            + Text(" 보냈어요")
                .font(.pretendard(size: 24, .semiBold))
                .foregroundColor(Color.KakaoBlack200)
            
            Text("\(listItem.account.bank) \(listItem.account.accountNumber)")
                .font(.pretendard(size: 13, .regular))
                .foregroundColor(Color.kakaoGray200)
                .padding(.top, 5)

            
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
        
    }
}

//struct TransferCompleteView_Previews: PreviewProvider {
//    static var previews: some View {
//        TransferCompleteView(loanAmount: 0)
//    }
//}
