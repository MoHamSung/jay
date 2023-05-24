//
//  ProductView.swift
//  act2
//
//  Created by Jay on 2023/05/22.
//

import SwiftUI

struct ProductView: View {
    
    var body: some View {
        VStack{
            Image("image_Product01")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .cornerRadius(14)
                .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.16), radius: 32 ,y: 4)
                .overlay {
                    HStack(spacing: 0) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("다채롭게 만개한 \n어버이날 선물")
                                .font(.system(size: 26, weight: .bold))
                                .foregroundColor(Color("ColorFontBlack"))
                                .padding(.top, 24)
                            
                            Text("쉽게 선물 쇼핑하기.")
                                .font(.system(size: 14))
                                .foregroundColor(Color("ColorFontBlack"))
                            Spacer()
                        }
                        .padding(.horizontal, 20)
//                        .border(.blue)
                        Spacer()
                    }
//                    .border(.red)
                }
        }
        
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}
