//
//  HeaderArea.swift
//  act6_kakaoBank
//
//  Created by Jay on 2023/08/11.
//

import SwiftUI

struct MainHeaderArea: View {
    let user = TestUser.instance.user // User(name: "김말티", imgString: "ImgProfile10")
    
    var body: some View {
        HStack(spacing: 0) {
            Text(user.name)
                .font(.pretendard(size: 23, .semiBold))
                .padding(.leading, 8)
                .padding(.trailing, 6)
            
            Text("내 계좌")
                .font(.pretendard(size: 13, .semiBold))
                .padding(EdgeInsets(top: 7, leading: 12, bottom: 7, trailing: 12))
                .background(Color.kakaoWhite200)
                .cornerRadius(14)
            
            Spacer()
            
            Image(user.imgString)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40)
                .padding(.trailing, 8)
        }
        .padding(.top, 84)
        .frame(maxWidth: .infinity)
        .ignoresSafeArea()
    }
}

struct MainHeaderArea_Previews: PreviewProvider {
    static var previews: some View {
        MainHeaderArea()
    }
}
