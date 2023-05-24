//
//  ProductSwipeView.swift
//  act2
//
//  Created by Jay on 2023/05/22.
//

import SwiftUI

struct ProductSwipeView: View {
    let products = [
        Product(id: 0, imageString: "image_Product01", title: "다채롭게 만개한 \n어버이날 선물", subTitle: "쉽게 선물 쇼핑하기.", titleColor: "ColorFontBlack"),
        Product(id: 1, imageString: "image_Product02", title: "iPhone 14 Pro \n딥 퍼플", subTitle: "몽환적인 색감, 색다른 경험.", titleColor: "ColorFontWhite"),
        Product(id: 2, imageString: "image_Product03", title: "MacBook Pro 14 \n및 16", subTitle: "이거 문구를 발견하고, 톡방에 메세지를 \n먼저 보내는 사람은 페페의 선물이!", titleColor: "ColorFontWhite")
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("추천")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color("ColorFontBlack"))
                .padding(.vertical, 38)
                .padding(.leading, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20){
                    ForEach(products) { product in
                        if product.id == 0 {
                            ProductView(product: product)
                                .frame(width: 335)
                                .padding(.leading, 20)
                        }
                        else if product.id == products.count - 1{
                            ProductView(product: product)
                                .frame(width: 335)
                                .padding(.trailing, 20)
                        }
                        else {
                            ProductView(product: product)
                                .frame(width: 335)
                        }
                    }
                    
                }
            }
            .frame(height: 507)
            
            //        .frame(minWidth: .infinity)
            //        .onAppear {
            //            UIScrollView.appearance().isPagingEnabled = true
            //        }
            
            Spacer()
                .frame(height: 100)
        }
    }
}

struct ProductSwipeView_Previews: PreviewProvider {
    static var previews: some View {
        ProductSwipeView()
    }
}
