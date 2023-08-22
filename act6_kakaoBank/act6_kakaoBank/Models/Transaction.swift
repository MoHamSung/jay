//
//  Transaction.swift
//  act6_kakaoBank
//
//  Created by Jay on 2023/08/11.
//

import Foundation

class Transaction: Identifiable {
    let id = UUID().uuidString
    let type: String
    let amount: Int
    let balance: Int // 거래 후 남은 금액
    let date: Date
    let sourceAccountId: String
    let destinationAccountId: String
    let transactionName: String // 거래 표시 이름
    
    init(type: String, amount: Int, balance: Int, date: Date, sourceAccountId: String, destinationAccountId: String, transactionName: String) {
        self.type = type
        self.amount = amount
        self.balance = balance
        self.date = date
        self.sourceAccountId = sourceAccountId
        self.destinationAccountId = destinationAccountId
        self.transactionName = transactionName
    }
    
    func getDate() -> String {
        let dateFomatter = DateFormatter()
        dateFomatter.dateFormat = "MM.dd"
        let date = dateFomatter.string(from: self.date)
        return date
    }
}
