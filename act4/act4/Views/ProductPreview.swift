//
//  ProductPreview.swift
//  act4
//
//  Created by Jay on 2023/06/23.
//

import SwiftUI

enum ColorState {
    case purple
    case gold
    case silver
    case spaceBlack
}

struct ProductPreview: View {
    @State var colorState = ColorState.purple
    @State var imgNumber = 1
    @State var colorString = "딥 퍼플"
    
    var body: some View {
        ZStack{
            Image("ImgMain0\(imgNumber)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .overlay {
                    VStack(spacing: 0){
                        Text("iPhone 14 Pro")
                            .padding(EdgeInsets(top: 70, leading: 0, bottom: 6, trailing: 0))
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                        Text("프로 그 이상.")
                            .font(.system(size: 40, weight: .bold))
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Text("\(colorString)")
                            .font(.system(size: 10))
                            .foregroundColor(Color("ColorFontDarkGray"))
                            .padding(.bottom, 10)
                        
                        HStack(spacing: 15){
                            Button {
                                colorState = .purple
                            } label: {
                                ZStack{
                                    
                                    Circle()
                                        .stroke(.blue)
                                        .frame(width: 31)
                                        .opacity(colorState == .purple ? 1 : 0)
                                    Circle()
                                        .frame(width: 23)
                                        .foregroundColor(Color("ColorBtnDeepPurple"))
                                }
                            }
                            Button {
                                colorState = .gold
                            } label: {
                                ZStack{
                                    
                                    Circle()
                                        .stroke(.blue)
                                        .frame(width: 31)
                                        .opacity(colorState == .gold ? 1 : 0)
                                    Circle()
                                        .frame(width: 23)
                                        .foregroundColor(Color("ColorBtnGold"))
                                }
                            }
                            Button {
                                colorState = .silver
                            } label: {
                                ZStack{
                                    
                                    Circle()
                                        .stroke(.blue)
                                        .frame(width: 31)
                                        .opacity(colorState == .silver ? 1 : 0)
                                    Circle()
                                        .frame(width: 23)
                                        .foregroundColor(Color("ColorBtnSilver"))
                                }
                            }
                            Button {
                                colorState = .spaceBlack
                            } label: {
                                ZStack{
                                    
                                    Circle()
                                        .stroke(.blue)
                                        .frame(width: 31)
                                        .opacity(colorState == .spaceBlack ? 1 : 0)
                                    Circle()
                                        .frame(width: 23)
                                        .foregroundColor(Color("ColorBtnBlack"))
                                }
                            }
                        }.padding(.bottom, 22)
                        Button {
                            print("김말티 바보")
                        } label: {
                            HStack(spacing: 4) {
                                Text("AR로 보기")
                                    .font(.system(size: 14))
                                Image(systemName: "arkit")
                                    .font(.system(size: 16))
                            }
                            .foregroundColor(Color("ColorBtnBlue"))
                            .padding(.bottom, 30)
                        }
                    }
                }
        }
        .onChange(of: colorState) { newValue in
            switch (colorState) {
            case .purple:
                imgNumber = 1
                colorString = "딥 퍼플"
            case .gold:
                imgNumber = 2
                colorString = "골드"
            case .silver:
                imgNumber = 3
                colorString = "실버"
            case .spaceBlack:
                imgNumber = 4
                colorString = "스페이스 블랙"
            }
        }
    }
}



struct ProductPreview_Previews: PreviewProvider {
    static var previews: some View {
        ProductPreview()
    }
}
