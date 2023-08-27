//
//  TransferSheetView.swift
//  act6_kakaoBank
//
//  Created by Jay on 2023/08/25.
//

import SwiftUI

struct TransferSheetView: View {
    @Binding var isTransferSheetShow: Bool
    @Binding var isTransferCompleted: Bool
    let listItem: ListItem
    let transferAmount: Int
    let account = TestUser.instance.userAccount

    var body: some View {
        VStack(spacing: 0) {
            Image(listItem.user.imgString)
                .resizable()
                .scaledToFit()
                .frame(width: 50)
                .padding(.bottom, 20)
            Text("\(listItem.user.name)")
                .font(.pretendard(size: 20, .semiBold))
            + Text("님에게")
                .font(.pretendard(size: 20, .regular))
            + Text(" \(transferAmount)원")
                .font(.pretendard(size: 20, .semiBold))
            
            
            Text("이체하시겠습니까?")
                .font(.pretendard(size: 20, .regular))
                .padding(.top, 4)
            Text("받는계좌: \(listItem.account.bank) \(listItem.account.accountNumber)")
                .font(.pretendard(size: 13, .regular))
                .foregroundColor(.kakaoGray300)
                .padding(.top, 14)
            
            HStack (spacing: 9){
                Button {
                    isTransferSheetShow = false
                } label: {
                    Text("취소")
                        .font(.pretendard(size: 16, .regular))
                        .foregroundColor(Color.KakaoBlack300)
                        .frame(maxWidth: .infinity)
                        .padding(.top, 21)
                        .padding(.bottom, 20)
                        .background(Color.kakaoWhite100)
                        .cornerRadius(10)
                }
                Button {
                    isTransferSheetShow = false
                    isTransferCompleted = true
                    let transaction = Transaction(type: "transfer", amount: transferAmount, balance: account.amount - transferAmount, date: Date(), sourceAccountId: account.accountNumber, destinationAccountId: listItem.account.accountNumber, transactionName: listItem.user
                        .name)
//                    
                    TestUser.instance.transactions.append(transaction)
                    TestUser.instance.userAccount.amount -= transferAmount
                    
                } label: {
                    Text("이체하기")
                        .font(.pretendard(size: 16, .regular))
                        .foregroundColor(Color.KakaoBlack300)
                        .frame(maxWidth: .infinity)
                        .padding(.top, 21)
                        .padding(.bottom, 20)
                        .background(Color.kakaoYellow)
                        .cornerRadius(10)
                }
                
            }
            .padding(.top, 43)
        }
        .padding(.horizontal, 16)
        .padding(.top, 50)
    }
}
//
//struct TransferSheetView_Previews: PreviewProvider {
//    static var previews: some View {
//        TransferSheetView()
//    }
//}
