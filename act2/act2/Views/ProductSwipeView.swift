//
//  ProductSwipeView.swift
//  act2
//
//  Created by Jay on 2023/05/22.
//

import SwiftUI

struct ProductSwipeView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("추천")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color("ColorFontBlack"))
                .padding(.vertical, 38)
                .padding(.leading, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20){
                    ProductView()
                        .frame(width: 335)
                        .padding(.leading, 20)
                    
                    ProductView()
                        .frame(width: 335)
                    
                    ProductView()
                        .frame(width: 335)
                        .padding(.trailing, 20)
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
