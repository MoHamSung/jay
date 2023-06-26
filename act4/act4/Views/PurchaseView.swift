//
//  PurchaseView.swift
//  act4
//
//  Created by Jay on 2023/06/25.
//

import SwiftUI

struct PurchaseView: View {
    var body: some View {
        VStack{
            CustomImageView(imgString: "ImgProduct01") {
                VStack{
                    Text("iPhone 14 Pro")
                        .foregroundColor(Color("ColorFontBlack"))
                        .font(.system(size: 26, weight: .bold))
                        .padding(.top, 60)
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("구입하기")
                            .foregroundColor(Color("ColorFontWhite"))
                            .font(.system(size: 14, weight: .semibold))
                            .padding(EdgeInsets(top: 5, leading: 14, bottom: 3, trailing: 14))
                            .background(Color("ColorBtnBlue"))
                            .cornerRadius(20)
                    }
                    
                    Text("₩ 1,550,000부터")
                        .foregroundColor(Color("ColorBgBlack"))
                        .font(.system(size: 10))
                        .padding(.top, 14)
                        .padding(.bottom, 51)
                    
                }
            }            
        }
    }
}

struct PurchaseView_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseView()
    }
}
