//
//  TitleView.swift
//  act2
//
//  Created by Jay on 2023/05/21.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        HStack{
            Text("쇼핑하기")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(Color("ColorFontBlack"))
                .padding(.top, 54)
                .padding(.bottom, 10)
            
            Spacer()
            
            Image("logo")
                .resizable()
                .frame(width: 37, height: 38)
                .padding(.top, 48)
                .padding(.bottom, 16)
        }
        .frame(maxWidth: .infinity)
//        .frame(height: 100)
        .border(Color.red)
        .padding(.horizontal, 20)
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
