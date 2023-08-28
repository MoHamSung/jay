//
//  PassBookArea.swift
//  act6_kakaoBank
//
//  Created by Jay on 2023/08/17.
//

import SwiftUI

struct PassBookArea: View {
    @State var accounts = [
        TestUser.instance.userAccount
        //Account(userId: "12345", bank: "카카오", accountNumber: "12345-12345", accountName: "김말티의 통장", amount: 100),
        //        Account(userId: "12345", account: "12345-12345", accountName: "김말티의 텅장", amount: 0),
    ]
    
    var body: some View {
        VStack (spacing: 8) {
            ForEach(accounts) {account in
                PassBook(account: account)
            }
        }
        .onAppear {
            Task {
                TestUser.instance.userAccount = try await FirebaseManager.instance.readAccount()!
            }
        }

    }
}

struct PassBook: View {
    @StateObject var navigationManager = NavigationManager.instance
    @State var account: Account
    var body: some View {
        VStack (spacing: 20){
            NavigationLink(value: StackViewType.detailView){
                HStack{
                    Image("ImgLogoKakao")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 16, height: 16)
                        .padding(9)
                        .background(Color("KakaoBlack200").opacity(0.1))
                        .cornerRadius(50)
                    
                    VStack (alignment: .leading, spacing: 6){
                        Text("\(account.accountName) ★")
                            .font(.pretendard(size: 14, .regular))
                        Text("\(account.amount)원")
                            .font(.pretendard(size: 19, .bold))
                    }
                    .foregroundColor(.black)
                    
                    Spacer()
                }
                .padding(.bottom, 40)
            }
            .overlay(alignment: .bottomTrailing){
                HStack(spacing: 10) {
                    Button {
                        
                    } label: {
                        Text("카드")
                            .font(.pretendard(size: 13, .semiBold))
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: 9, leading: 16, bottom: 9, trailing: 16))
                            .background(Color("KakaoBlack200").opacity(0.1))
                            .cornerRadius(30)
                    }
                    Button {
                        
                    } label: {
                        Text("이체")
                            .font(.pretendard(size: 13, .semiBold))
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: 9, leading: 16, bottom: 9, trailing: 16))
                            .background(Color("KakaoBlack200").opacity(0.1))
                            .cornerRadius(30)
                    }
                    
                }
            }
            
            Divider()
            
            HStack {
                Text("세이프 박스")
                    .font(.pretendard(size: 14, .regular))
                Spacer()
                Text("0원")
                    .font(.pretendard(size: 16, .bold))
            }
        }
        .padding(EdgeInsets(top: 29, leading: 20, bottom: 23, trailing: 22))
        .background(Color.kakaoYellow)
        .cornerRadius(18)

    }
}

struct PassBookArea_Previews: PreviewProvider {
    static var previews: some View {
        PassBookArea()
    }
}
