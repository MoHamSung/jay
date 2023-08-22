//
//  NumberPadArea.swift
//  act6_kakaoBank
//
//  Created by Jay on 2023/08/21.
//

import SwiftUI

struct NumberPadArea: View {
    @Binding var loanAmount: Int
    var body: some View {
        VStack(spacing: 0){
            HStack(spacing: 0) {
                NumberKey(number: 1, alignment: .leading)
                NumberKey(number: 2)
                NumberKey(number: 3, alignment: .trailing)
            }
            HStack(spacing: 0) {
                NumberKey(number: 4, alignment: .leading)
                NumberKey(number: 5)
                NumberKey(number: 6, alignment: .trailing)
            }
            HStack(spacing: 0) {
                NumberKey(number: 7, alignment: .leading)
                NumberKey(number: 8)
                NumberKey(number: 9, alignment: .trailing)
            }
            HStack(spacing: 0) {
                NumberKey(number: -2, alignment: .leading)
                NumberKey(number: 0)
                NumberKey(number: -1, alignment: .trailing)
            }
        }
    }
    
    @ViewBuilder func NumberKey(number: Int, alignment: Alignment = .center) -> some View {
        Button {
            numberPressed(number: number)
        } label : {
            switch number {
            case -2:
                Text("00")
                    .modifier(CustomNumberPadTextModifire(alignment: alignment))
            case -1:
                Text("\(Image(systemName: "arrow.left"))")
                    .modifier(CustomNumberPadTextModifire(alignment: alignment))
                    
            default:
                Text("\(number)")
                    .modifier(CustomNumberPadTextModifire(alignment: alignment))
            }
        }
    }
            
    func numberPressed(number: Int) {
        var calculatedNum = 0
        switch number {
        case -2:
            calculatedNum = loanAmount * 100
        case -1:
            calculatedNum = loanAmount / 10
        default:
            if loanAmount == 0 {
                calculatedNum = number
            }
            else {
                calculatedNum = loanAmount * 10 + number
            }
        }
        if calculatedNum >= 1000000000{
            print("숫자 초과")
        } else{
            loanAmount = calculatedNum
        }
    }
}

struct CustomNumberPadTextModifire: ViewModifier {
    let alignment: Alignment
    func body(content: Content) -> some View {
        content
            .font(.pretendard(size: 22, .medium))
            .foregroundColor(Color.kakaoGray300)
            .frame(width: 70)
            .frame(maxWidth: .infinity, alignment: alignment)
            .padding(.top, 27)
            .padding(.bottom, 7)
    }
}

struct NumberPadArea_Previews: PreviewProvider {
    static var previews: some View {
        NumberPadArea(loanAmount: .constant(0))
    }
}
