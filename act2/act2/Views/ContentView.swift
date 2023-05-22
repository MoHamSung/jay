//
//  ContentView.swift
//  act2
//
//  Created by Jay on 2023/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            
            VStack(spacing: 0) {
                TitleView()
                Divider()
                    .padding(.horizontal, 20)
                    .foregroundColor(Color("ColorDividerGray"))
                PromotionTabView()
                Divider()
                    .foregroundColor(Color("ColorDividerGray"))
                
                NewItemView(itemState: "NEW", itemTitle: "iPhone 14", describe: "iPhone 14 그리고 큼직한 사이즈의 iPhone 14 Plus. 획기적인 도약을 이뤄낸 배터리 성능. 프로급 카메라. 6가지 멋진 컬러.", imageString: "image_iPhone14", price: "1,250,000")
                
                NewItemView(itemState: "NEW", itemTitle: "iPad", describe: "다양한 일상 작업에 맞는 완전히 새롭고, 컬러풀한 iPad. 새로운 iPad를 소개합니다.", imageString: "image_iPad", price: "1,250,000")
                
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
