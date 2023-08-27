//
//  LoanView.swift
//  act6_kakaoBank
//
//  Created by Jay on 2023/08/21.
//

import SwiftUI

struct LoanView: View {
    @State var loanAmount = 0
    @State var isLoanSheetShow = false
    @State var isLoanCompleted = false
    let account = TestUser.instance.userAccount //Account(userId: "1234", bank: "카카오", accountNumber: "4321-1234", accountName: "김말티의 통장", amount: 5000000)
    let elonMusk = User(name: "일론머스크", imgString: "musk")
    let elonMuskAccount = Account(userId: "1234", bank: "카카오", accountNumber: "1234", accountName: "일론머스크", amount: 0)
    
    var body: some View {
        if !isLoanCompleted {
            VStack(spacing: 12) {
                VStack {
                    Spacer()
                    if loanAmount == 0 {
                        Text("대출금액")
                            .font(.pretendard(size: 36, .regular))
                            .foregroundColor(Color.kakaoGray100)
                    }
                    else {
                        HStack(spacing: 2){
                            Text("\(loanAmount)")
                                .font(.pretendard(size: 48, .semiBold))
                            Text("원")
                                .font(.pretendard(size: 38, .semiBold))
                        }
                        .foregroundColor(Color.KakaoBlack200)
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
                    .padding(.horizontal, 14)
                
                AddValueBtn(amount: $loanAmount)
                    .padding(.horizontal, 14)
                NumberPadArea(amount: $loanAmount)
                    .padding(.horizontal, 14)

                
                Button {
                    isLoanSheetShow.toggle()
                } label: {
                    Text("다음")
                        .font(.pretendard(size: 16, .regular))
                        .foregroundColor(Color.KakaoBlack300)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 20)
                        .background(loanAmount == 0 ? Color.kakaoWhite100 : Color.kakaoYellow)
                        .cornerRadius(10)
                }.disabled(loanAmount == 0 ? true : false)
                
            }
            .padding(.horizontal, 16)
            .sheet(isPresented: $isLoanSheetShow) {
                LoanSheetView(isLoanSheetShow: $isLoanSheetShow, isLoanCompleted: $isLoanCompleted, userAccount: account, elonMusk: elonMusk, elonMuskAccount: elonMuskAccount, loanAmount: loanAmount)
                    .presentationDetents([.fraction(0.4)])
            }
        }
        else if isLoanCompleted {
            LoanCompleteView(loanAmount: loanAmount)
                .navigationBarBackButtonHidden()
        }
    }
}

struct LoanView_Previews: PreviewProvider {
    static var previews: some View {
        LoanView()
    }
}
