//
//  TransactionDetailArea.swift
//  act6_kakaoBank
//
//  Created by Jay on 2023/08/21.
//

import SwiftUI

struct TransactionDetailArea: View {
    //TODO: 여기서 데이터 불러오는 과정이 있어야 함.
    let transactions: [Transaction] = TestUser.instance.transactions
//    [
//        Transaction(type: "loan", amount: 5000000, balance: 500, date: Date(), sourceAccountId: "1234", destinationAccountId: "4321", transactionName: "일론머스크"),
//        Transaction(type: "transfer", amount: 5000000, balance: 500, date: Date(), sourceAccountId: "1234", destinationAccountId: "4321", transactionName: "멜제이"),
//        ]
    
    var body: some View {
        VStack {
            ForEach(transactions.reversed()) {transaction in
                TransactionListItem(transaction: transaction)
            }
            
            
        }
    }
}

struct TransactionListItem: View {
    let transaction: Transaction
    
    var body: some View {
        HStack(spacing: 0) {
            Text("\(transaction.getDate())")
                .font(.pretendard(size: 13, .regular))
                .foregroundColor(Color.kakaoGray300)
                .padding(.trailing, 19)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(transaction.transactionName)
                    .font(.pretendard(size: 16, .regular))
                    .foregroundColor(Color.KakaoBlack200)
                Text(transaction.type == "loan" ? "#대출" : "#이체" )
                    .font(.pretendard(size: 12, .regular))
                    .foregroundColor(Color.kakaoBlue300)
            }
            Spacer()
            
            VStack(alignment: .trailing , spacing: 4) {
                if transaction.type == "loan"{
                    Text("\(transaction.amount)원")
                        .font(.pretendard(size: 16, .bold))
                        .foregroundColor(Color.kakaoBlue200)
                }
                else {
                    Text("-\(transaction.amount)원")
                        .font(.pretendard(size: 16, .bold))
                        .foregroundColor(Color.KakaoBlack200)
                }
                Text("\(transaction.balance)원")
                    .font(.pretendard(size: 14, .regular))
                    .foregroundColor(Color.kakaoGray200)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 25)
    }
}

struct TransactionDetailArea_Previews: PreviewProvider {
    static var previews: some View {
        TransactionDetailArea()
    }
}
