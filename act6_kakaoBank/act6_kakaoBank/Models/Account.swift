//
//  Account.swift
//  act6_kakaoBank
//
//  Created by Jay on 2023/08/11.
//

import Foundation

class Account: Identifiable, Codable {
    let id = UUID().uuidString
    var userId: String
    let bank: String
    let accountNumber: String
    var accountName: String
    var amount: Int
    
    init(userId: String, bank: String, accountNumber: String, accountName: String, amount: Int) {
        self.userId = userId
        self.bank = bank
        self.accountNumber = accountNumber
        self.accountName = accountName
        self.amount = amount
    }
}
