//
//  AddValueBtn.swift
//  act6_kakaoBank
//
//  Created by Jay on 2023/08/21.
//

import SwiftUI

struct AddValueBtn: View {
    @Binding var loanAmount: Int
    
    var body: some View {
        HStack{
            valueBtn(number: 1)
            Spacer()
            valueBtn(number: 5)
            Spacer()
            valueBtn(number: 10)
        }
    }
    @ViewBuilder func valueBtn(number: Int) -> some View {
        Button {
            btnPressed(number: number)
        } label: {
            Text("+\(number)만")
                .font(.pretendard(size: 12, .bold))
                .foregroundColor(Color.kakaoGray300)
                .padding(EdgeInsets(top: 8, leading: 27, bottom: 8, trailing: 27))
                .border(Color.kakaoGray100)
                .cornerRadius(8)
        }
    }
    func btnPressed(number: Int){
        loanAmount += (number * 10000)
    }
}

struct AddValueBtn_Previews: PreviewProvider {
    static var previews: some View {
        AddValueBtn(loanAmount: .constant(0))
    }
}
