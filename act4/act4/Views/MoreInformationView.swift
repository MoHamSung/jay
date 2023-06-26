//
//  MoreInformationView.swift
//  act4
//
//  Created by Jay on 2023/06/26.
//

import SwiftUI

struct MoreInformationView: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("iPhone 14 Pro 더 깊이 살펴보기")
                .foregroundColor(Color("ColorFontBlack"))
                .font(.system(size: 24, weight: .semibold))
                .frame(maxWidth: .infinity)
            
            Button{
                print("김말티 천재")
            } label: {
                Text("apple.com에서 더 알아보기")
                    .foregroundColor(Color("ColorBtnBlue"))
                    .font(.system(size: 12))
            }
        }
        .frame(height: 173)
        .background(Color("ColorBgWhite"))
    }
}

struct MoreInformationView_Previews: PreviewProvider {
    static var previews: some View {
        MoreInformationView()
    }
}
