//
//  PlusPassBookArea.swift
//  act6_kakaoBank
//
//  Created by Jay on 2023/08/17.
//

import SwiftUI

struct PlusPassBookArea: View {
    var body: some View {
        Button {
            
        } label: {
            Text(Image(systemName: "plus"))
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(Color("kakaoGray200"))
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(Color("kakaoWhite200"))
                .cornerRadius(18)
        }
            
    }
}

struct PlusPassBookArea_Previews: PreviewProvider {
    static var previews: some View {
        PlusPassBookArea()
    }
}
