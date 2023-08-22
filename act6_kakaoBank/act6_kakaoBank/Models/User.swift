//
//  User.swift
//  act6_kakaoBank
//
//  Created by Jay on 2023/08/11.
//

import Foundation

class User {
    
    let id = UUID().uuidString
    let name: String
    let imgString: String
    
    init(name: String, imgString: String) {
        self.name = name
        self.imgString = imgString
    }
}
