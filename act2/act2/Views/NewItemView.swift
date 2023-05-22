//
//  NewItemView.swift
//  act2
//
//  Created by Jay on 2023/05/22.
//

import SwiftUI

struct NewItemView: View {
    let itemState: String?
    let itemTitle: String?
    let describe: String?
    let imageString: String
    let price: String
    
    var body: some View {
        VStack{
            Image(imageString)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
//                .border(Color.red)
                .overlay {
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text(itemState ?? "")
                            .font(.system(size: 10))
                            .foregroundColor(Color("ColorFontGray"))
                            .padding(.top, 24)
                            .padding(.bottom, 2)
//                            .border(Color.blue)
                        
                        Text(itemTitle ?? "")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(Color("ColorFontBlack"))
                            .padding(.bottom, 12)
//                            .border(Color.blue)
                        
                        Text(describe ?? "")
                            .font(.system(size: 13))
                            .foregroundColor(Color("ColorFontBlack"))
                            .lineSpacing(3)
//                            .border(Color.blue)
                        
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                }
            Spacer()
                .frame(height: 31)
            HStack{
                Text("₩\(price)부터")
                    .font(.system(size: 10))
                    .foregroundColor(Color("ColorFontBlack"))
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("구입하기")
                        .font(.system(size: 13))
                        .padding(.horizontal, 16)
                        .padding(.vertical, 6)
                        .background(Color("ColorButtonGray"))
                        .cornerRadius(17)
                }
            }
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity)
            .frame(height: 67)
            .background(Color("ColorPricebarGray"))
//            .border(Color.red)
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(itemState: "New", itemTitle: "iPhone 14", describe: "iPhone 14 그리고 큼직한 사이즈의 iPhone 14 Plus. 획기적인 도약을 이뤄낸 배터리 성능. 프로급 카메라. 6가지 멋진 컬러.", imageString: "image_iPhone14", price: "1,250,000")
    }
}
