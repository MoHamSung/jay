//
//  BottomOptionArea.swift
//  act6_kakaoBank
//
//  Created by Jay on 2023/08/17.
//

import SwiftUI

struct BottomOptionArea: View {
    var body: some View {
        HStack(spacing: 33) {
            Button{
            
            }label: {
                Text("간편 홈")
            }
            
            Divider().frame(height: 13)
            Button{
            
            }label: {
                Text("화면 편집")
            }
            
        }
        .font(.pretendard(size: 14, .regular))
        .foregroundColor(Color("kakaoGray200"))
        .padding(.vertical, 38)
        .frame(maxWidth: .infinity)
    }
}

struct BottomOptionArea_Previews: PreviewProvider {
    static var previews: some View {
        BottomOptionArea()
    }
}
