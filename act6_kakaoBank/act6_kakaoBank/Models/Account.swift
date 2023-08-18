//
//  Account.swift
//  act6_kakaoBank
//
//  Created by Jay on 2023/08/11.
//

import Foundation

class Account {
    let id = UUID().uuidString
    var userId: String
    let account: String
    var accountName: String
    var amount: Int
    
    init(userId: String, account: String, accountName: String, amount: Int) {
        self.userId = userId
        self.account = account
        self.accountName = accountName
        self.amount = amount
    }
}
