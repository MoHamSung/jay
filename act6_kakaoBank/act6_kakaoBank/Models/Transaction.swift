//
//  Transaction.swift
//  act6_kakaoBank
//
//  Created by Jay on 2023/08/11.
//

import Foundation

class Transaction {
    let id = UUID().uuidString
    let type: String
    let amount: Int
    let date: Date
    let sourceAccountId: String
    let destinationAccountId: String
    
    init(type: String, amount: Int, date: Date, sourceAccountId: String, destinationAccountId: String) {
        self.type = type
        self.amount = amount
        self.date = date
        self.sourceAccountId = sourceAccountId
        self.destinationAccountId = destinationAccountId
    }
}
