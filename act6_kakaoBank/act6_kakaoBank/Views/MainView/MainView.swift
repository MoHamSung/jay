//
//  MainView.swift
//  act6_kakaoBank
//
//  Created by Jay on 2023/08/11.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var authenticationManager = AuthenticationManager()
    
    var body: some View {
        switch authenticationManager.signUpState {
        case .beforeSignUp:
            Button{
                let auththentication = AuthenticationManager()
                Task {
                    try await auththentication.singInGoogle()
                }
            } label: {
                Text("구글 로그인")
                    .onAppear {
                        if let currentuser = FirebaseManager.instance.getCurrentUserId() {
                            authenticationManager.signUpState = .afterSignUp
                        }
                    }
            }
            
            
        case .duringSignUp:
            Text("")
        case .afterSignUp:
            VStack(spacing: 0) {
                MainHeaderArea()
                
                ScrollView {
                    VStack(spacing: 8) {
                        BannerArea()
                            .padding(.top, 10)
                        PassBookArea()
                        PlusPassBookArea()
                        BottomOptionArea()
                        Button("LogOut"){
                            Task {
                               try authenticationManager.logOut()
                            }
                        }
                    }
                }
            }
            .ignoresSafeArea()
            .padding(.horizontal, 20)
            //        .navigationDestination(for: StackViewType.self) { value in
            //            switch value {
            //            case .mainView:
            //                MainView()
            //            case .detailView:
            //                DetailView()
            //            case .loanView:
            //                LoanView()
            //            case .transferView:
            //                TransferView()
            //            }
            //        }
            .navigationDestination(for: StackViewType.self) { value in
                value.view
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
