//
//  TransferAddValueArea.swift
//  act6_kakaoBank
//
//  Created by Jay on 2023/08/25.
//

import SwiftUI

struct TransferAddValueArea: View {
    @Binding var amount: Int
    let account: Account
    var body: some View {
        HStack{
            valueBtn(number: 1)
            Spacer()
            valueBtn(number: 5)
            Spacer()
            valueBtn(number: 10)
            Spacer()
            valueBtn()
        }
    }
    @ViewBuilder func valueBtn(number: Int) -> some View {
        Button {
            btnPressed(number: number)
        } label: {
            Text("+\(number)만")
                .font(.pretendard(size: 12, .bold))
                .foregroundColor(Color.kakaoGray300)
                .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                .frame(maxWidth: .infinity)
                .border(Color.kakaoGray100)
                .cornerRadius(8)
        }
    }
    
    @ViewBuilder func valueBtn() -> some View {
        Button {
            allBtbPressed()
        } label: {
            Text("전액")
                .font(.pretendard(size: 12, .bold))
                .foregroundColor(Color.kakaoGray300)
                .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                .frame(maxWidth: .infinity)
                .border(Color.kakaoGray100)
                .cornerRadius(8)
        }
    }
    
    func btnPressed(number: Int){
        amount += (number * 10000)
    }
    
    func allBtbPressed(){
        amount = account.amount
    }
}

struct TransferAddValueArea_Previews: PreviewProvider {
    static var previews: some View {
        TransferAddValueArea(amount: .constant(0), account: Account(userId: "", bank: "", accountNumber: "", accountName: "", amount: 10000))
    }
}
