//
//  AuthenticationManager.swift
//  act6_kakaoBank
//
//  Created by Jay on 2023/08/27.
//

import Foundation
import FirebaseAuth

enum SignUpState {
    case beforeSignUp
    case duringSignUp
    case afterSignUp
}

class AuthenticationManager: ObservableObject {
    @Published var signUpState = SignUpState.beforeSignUp
    let firebaseManager = FirebaseManager.instance
    
    /// 구글 로그인을 실행합니다.
    func singInGoogle() async throws {
        self.signUpState = .duringSignUp
        let helper = SignInWithGoogle()
        let tokens = try await helper.signInWithGoogle()
        let credential = GoogleAuthProvider.credential(withIDToken: tokens.idToken, accessToken: tokens.accessToken)
        try await self.signIn(credential: credential)
    }
    
    @MainActor
    func signIn(credential: AuthCredential) async throws {
        let authDataResult = try await Auth.auth().signIn(with: credential)
//        let authResultUser = authDataResult.user
        self.signUpState = .afterSignUp

        // 이후 코드 추가해야함
        try await firebaseManager.createUser()
        try await firebaseManager.createAccount()
    }
    
    func logOut() throws {
        try Auth.auth().signOut()
        self.signUpState = .beforeSignUp
    }
}

