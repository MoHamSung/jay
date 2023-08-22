//
//  LoanSheetView.swift
//  act6_kakaoBank
//
//  Created by Jay on 2023/08/21.
//

import SwiftUI

struct LoanSheetView: View {
    @Binding var isLoanSheetShow: Bool
    @Binding var isLoanCompleted: Bool
    let userAccount: Account // Account(userId: "12345", bank: "카카오", accountNumber: "12345-12345", accountName: "김말티의 통장", amount: 100)
    let elonMusk: User //= User(name: "일론머스크", imgString: "musk")
    let elonMuskAccount: Account // = Account(userId: "1234", bank: "카카오", accountNumber: "1234", accountName: "일론머스크", amount: 0)
    let loanAmount: Int
    var body: some View {
        VStack(spacing: 0) {
            Image(elonMusk.imgString)
                .resizable()
                .scaledToFit()
                .frame(width: 50)
                .padding(.bottom, 20)
            Text("\(elonMusk.name)")
                .font(.pretendard(size: 20, .semiBold))
            + Text("님에게")
                .font(.pretendard(size: 20, .regular))
            + Text(" \(loanAmount)원")
                .font(.pretendard(size: 20, .semiBold))
                
            
            Text("대출 받으시겠습니까?")
                .font(.pretendard(size: 20, .regular))
                .padding(.top, 4)
            Text("받는계좌: \(userAccount.bank) \(userAccount.accountNumber)")
                .font(.pretendard(size: 13, .regular))
                .foregroundColor(.kakaoGray300)
                .padding(.top, 14)
            
            HStack (spacing: 9){
                Button {
                    isLoanSheetShow = false
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
                    isLoanSheetShow = false
                    isLoanCompleted = true
                    let transaction = Transaction(type: "loan", amount: loanAmount, balance: userAccount.amount + loanAmount, date: Date(), sourceAccountId: elonMuskAccount.accountNumber, destinationAccountId: userAccount.accountNumber, transactionName: elonMuskAccount.accountName)
                    
                    TestUser.instance.transactions.append(transaction)
                    TestUser.instance.userAccount.amount += loanAmount
                    
                } label: {
                    Text("대출받기")
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

//struct LoanSheetView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoanSheetView(isLoanSheetShow: .constant(true), loanAmount: 50000)
//    }
//}
