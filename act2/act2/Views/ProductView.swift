//
//  ProductView.swift
//  act2
//
//  Created by Jay on 2023/05/22.
//

import SwiftUI

struct ProductView: View {
    let product: Product
    
    var body: some View {
        VStack{
            Image(product.imageString)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .cornerRadius(14)
                .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.16), radius: 32 ,y: 4)
                .overlay {
                    HStack(spacing: 0) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(product.title)
                                .font(.system(size: 26, weight: .bold))
                                .foregroundColor(Color(product.titleColor))
                                .padding(.top, 24)
                            
                            Text(product.subTitle)
                                .font(.system(size: 14))
                                .foregroundColor(Color("ColorFontGray"))
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
        ProductView(product: Product(id: 0, imageString: "image_Product01", title: "다채롭게 만개한 \n어버이날 선물", subTitle: "쉽게 선물 쇼핑하기.", titleColor: "ColorFontGray"))
        
        
    }
}
