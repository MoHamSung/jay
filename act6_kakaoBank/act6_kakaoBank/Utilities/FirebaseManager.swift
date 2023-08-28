//
//  FirebaseManager.swift
//  act6_kakaoBank
//
//  Created by Jay on 2023/08/27.
//

import FirebaseFirestore
import FirebaseAuth
import FirebaseFirestoreSwift

class FirebaseManager: ObservableObject {
    
    static let instance = FirebaseManager()
    private var db = Firestore.firestore()
    
    /// 현재 유저의 uid를 가져옵니다.
    func getCurrentUserId() -> String? {
        return Auth.auth().currentUser?.uid
    }
    
    func createUser() async throws {
        guard let userId = getCurrentUserId() else {return}
        let user = User(name: "멜제이", imgString: "ImgProfile09")
        
        try await db.collection("user").document(userId).setData([
            "id": userId,
            "name": user.name,
            "imgString": user.imgString
        ])
    }
    
    func readUser() async throws -> User? {
        
        guard let userId = getCurrentUserId() else {return nil}
        let docRef = db.collection("user").document(userId)
        
        var result: User? = nil
        
        do {
            let document = try await docRef.getDocument(as: User.self)
            result = document
        } catch {
            result = nil
        }
        
        return result
    }
    
    func createAccount() async throws {
        
        guard let userId = getCurrentUserId() else {return}
        let account = Account(userId: userId, bank: "은행이름", accountNumber: "1234-1234", accountName: "멜팅통정", amount: 0)
        
        try await db.collection("account").document(userId).setData([
            "userId": userId,
            "bank": account.bank,
            "accountNumber": account.accountNumber,
            "accountName": account.accountName,
            "account": account.amount
        ])
    }
    
    func readAccount() async throws -> Account? {
        guard let userId = getCurrentUserId() else {return nil}
        
        let docRef = db.collection("account").document(userId)
        
        var result: Account? = nil
        result = try await docRef.getDocument(as: Account.self)
        
        return result
    }
}
