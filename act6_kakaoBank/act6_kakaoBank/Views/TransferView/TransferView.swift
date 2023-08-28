//
//  TransferView.swift
//  act6_kakaoBank
//
//  Created by Jay on 2023/08/21.
//

import SwiftUI

struct TransferView: View {
    @State var transferAmount = 0
    @State var isTransferSheetShow = false
    @State var isTransferCompleted = false
    let account = TestUser.instance.userAccount
    let listItem: ListItem
    
    var body: some View {
        if !isTransferCompleted {
            VStack(spacing: 12) {
                VStack {
                    Spacer()
                    if transferAmount == 0 {
                        Text("보낼금액")
                            .font(.pretendard(size: 36, .regular))
                            .foregroundColor(Color.kakaoGray100)
                    }
                    else {
                        HStack(spacing: 2){
                            Text("\(transferAmount)")
                                .font(.pretendard(size: 48, .semiBold))
                            Text("원")
                                .font(.pretendard(size: 38, .semiBold))
                        }
                        .foregroundColor(account.amount < transferAmount ? .red : Color.KakaoBlack200)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                    }
                    Spacer()
                }
                
                Text("잔액: \(account.amount)원")
                    .font(.pretendard(size: 14, .regular))
                    .foregroundColor(Color.kakaoGray300)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 14)
                    .padding(.leading, 20)
                    .background(Color.kakaoWhite200)
                    .cornerRadius(8)
                TransferAddValueArea(amount: $transferAmount, account: account)
                NumberPadArea(amount: $transferAmount)
                
                /// 다음 버튼
                Button {
                    isTransferSheetShow.toggle()
                } label: {
                    Text("다음")
                        .font(.pretendard(size: 16, .regular))
                        .foregroundColor(Color.KakaoBlack300)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 20)
                        .background((account.amount < transferAmount || transferAmount <= 0) ? Color.kakaoWhite100 : Color.kakaoYellow)
                        .cornerRadius(10)
                }.disabled((account.amount < transferAmount || transferAmount <= 0) ? true : false)
            }
            .padding(.horizontal, 30)
            .sheet(isPresented: $isTransferSheetShow) {
                TransferSheetView(isTransferSheetShow: $isTransferSheetShow, isTransferCompleted: $isTransferCompleted, listItem: listItem, transferAmount: transferAmount)
                    .presentationDetents([.fraction(0.4)])
            }
            


        }
        else if isTransferCompleted {
            TransferCompleteView(transferAmount: transferAmount, listItem: listItem)
        }
    }
}

//struct TransferView_Previews: PreviewProvider {
//    static var previews: some View {
////        TransferView(listItem: ListItem(user: <#T##User#>, account: <#T##Account#>))
//    }
//}
