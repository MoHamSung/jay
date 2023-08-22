//
//  MainView.swift
//  act6_kakaoBank
//
//  Created by Jay on 2023/08/11.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack(spacing: 0) {
            MainHeaderArea()
            
            ScrollView {
                VStack(spacing: 8) {
                    BannerArea()
                        .padding(.top, 10)
                    PassBookArea()
                    PlusPassBookArea()
                    BottomOptionArea()
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

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
