//
//  NavigationButton.swift
//  act4
//
//  Created by Jay on 2023/06/26.
//

import SwiftUI

struct NavigationButton: View {
    var body: some View {
        HStack{
            Text("₩1,250,000부터")
                .font(.system(size: 10))
                .foregroundColor(Color("ColorFontBlack"))
            Spacer()
            Button {
                print("김말티 구매~")
            } label: {
                Text("구입하기")
                    .font(.system(size: 13))
                    .foregroundColor(Color("ColorBtnBlue"))
                    .padding(EdgeInsets(top: 6, leading: 20, bottom: 6, trailing: 20))
            }
            .padding(.vertical, 20)
        }
        .padding(.horizontal, 20)
        .background(.ultraThinMaterial)
        .cornerRadius(16)
    }
}

struct NavigationButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigationButton()
    }
}
