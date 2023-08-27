//
//  ListArea.swift
//  act6_kakaoBank
//
//  Created by Jay on 2023/08/23.
//

import SwiftUI


struct ListArea: View {
    @State var listItems = [
        ListItem(user: User(name: "김페페", imgString: "ImgProfile01"), account: Account(userId: "1", bank: "카카오", accountNumber: "1234-1234", accountName: "김페페의 통장", amount: 0)),
        ListItem(user: User(name: "엠케이", imgString: "ImgProfile02"), account: Account(userId: "1", bank: "국민", accountNumber: "1234-1234", accountName: "엠케이의 통장", amount: 0)),
        ListItem(user: User(name: "이채드", imgString: "ImgProfile03"), account: Account(userId: "1", bank: "신한", accountNumber: "1234-1234", accountName: "이채드의 통장", amount: 0)),
        ListItem(user: User(name: "박루나", imgString: "ImgProfile04"), account: Account(userId: "1", bank: "바보", accountNumber: "1234-1234", accountName: "박루나의 통장", amount: 0)),
        ListItem(user: User(name: "로이스", imgString: "ImgProfile05"), account: Account(userId: "1", bank: "국민", accountNumber: "1234-1234", accountName: "로이스의 통장", amount: 0)),
        ListItem(user: User(name: "하명관", imgString: "ImgProfile06"), account: Account(userId: "1", bank: "똥망", accountNumber: "1234-1234", accountName: "하명관의 통장", amount: 0)),
        ListItem(user: User(name: "김래쉬", imgString: "ImgProfile07"), account: Account(userId: "1", bank: "카카오", accountNumber: "1234-1234", accountName: "김래쉬의 통장", amount: 0)),
        ListItem(user: User(name: "김시즈", imgString: "ImgProfile08"), account: Account(userId: "1", bank: "우리", accountNumber: "1234-1234", accountName: "김시즈의 통장", amount: 0)),
        ListItem(user: User(name: "멜제이", imgString: "ImgProfile09"), account: Account(userId: "1", bank: "국민", accountNumber: "1234-1234", accountName: "멜제이의 통장", amount: 0)),
        ListItem(user: User(name: "김말티", imgString: "ImgProfile10"), account: Account(userId: "1", bank: "바보", accountNumber: "1234-1234", accountName: "김페페의 통장", amount: 0)),
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0){
                ForEach(listItems) { item in
                    ListItemView(listItem: item)
                }
            }
        }
    }
}

struct ListItem: Identifiable {
    let id = UUID().uuidString
    let user: User
    let account: Account
}

struct ListItemView: View {
    let listItem: ListItem
    
    var body: some View {
        NavigationLink(destination: TransferView(listItem: listItem)) {
            HStack(spacing: 13) {
                Image(listItem.user.imgString)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 44, height: 44)
                
                VStack (alignment: .leading, spacing: 3) {
                    Text(listItem.user.name)
                        .font(.pretendard(size: 16, .medium))
                        .foregroundColor(Color.KakaoBlack200)
                    
                    Text("\(listItem.account.bank) \(listItem.account.accountNumber)")
                        .font(.pretendard(size: 12, .regular))
                        .foregroundColor(Color.kakaoGray200)
                }
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
        }
    }
}

struct ListArea_Previews: PreviewProvider {
    static var previews: some View {
        ListArea()
    }
}
