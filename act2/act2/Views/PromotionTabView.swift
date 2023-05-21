//
//  PromotionView.swift
//  act2
//
//  Created by Jay on 2023/05/21.
//

import SwiftUI

struct PromotionTabView: View {
    let items = [
        PromotionItem(id: 0, imageString: "shippingbox", title: "무료 배송", body: "집으로 배송 받으세요. 아니면 Apple Store에서 재고\n제품을 픽업하세요.", linkString: "더 알아보기"),
        PromotionItem(id: 1, imageString: "macbook.and.iphone", title: "Apple Trade In", body: "iPhone 8 이후 모델을 보상 판매하면 iPhone 14\n또는 iPhone 14 Pro 구입 시 사용할 수 있는 ₩40,000 ~\n₩780,000 상당의 크레딧이.*", linkString: "더 알아보기"),
        PromotionItem(id: 2, imageString: "airpodspro.chargingcase.wireless", title: "Airpod Pro", body: "에어팟 프로를 잃어버렸습니다.\n제발 제 에어팟 프로를 찾아주세요.\n찾아주신 분에겐 ₩20,000 상당의 크레딧이.*", linkString: "더 알아보기")
    ]
    
    var body: some View {
        TabView {
            ForEach(items) { item in
                PromotionItemView(item: item)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .frame(maxWidth: .infinity)
        .frame(height: 138)
    }
}

struct PromotionItemView: View{
    let item: PromotionItem
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: item.imageString)
                .resizable()
                .frame(width: 45, height: 43)
                .padding(.top, 20)
                .padding(.bottom, 75)
            
            VStack(alignment: .leading, spacing: 4){
                Text(item.title)
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(Color("ColorFontBlack"))
                Text(item.body)
                    .font(.system(size: 12))
                    .foregroundColor(Color("ColorFontGray"))
                Button {
                    
                } label: {
                    Text(item.linkString)
                        .font(.system(size: 12))
                }
            }
            .padding(.top, 20)
            .padding(.bottom, 48)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 138)
        .border(Color.red)
        .padding(.horizontal, 20)
        
    }
}

struct PromotionView_Previews: PreviewProvider {
    static var previews: some View {
        PromotionTabView()
    }
}
