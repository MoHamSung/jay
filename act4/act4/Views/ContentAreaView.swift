//
//  ContentAreaView.swift
//  act4
//
//  Created by Jay on 2023/06/25.
//

import SwiftUI

struct ContentAreaView: View {
    var body: some View {
        VStack (spacing: 20){
            CustomImageView(imgString: "ImgContentL01"){
                VStack {
                    VStack(spacing: 4){
                        Text("채드도 놀란")
                            .foregroundColor(Color("ColorFontWhite"))
                            .font(.system(size: 20, weight: .bold))
                            .padding(.top, 40)
                        Text("iPhone 14 Pro")
                            .foregroundColor(Color("ColorFontWhite"))
                            .font(.system(size: 30, weight: .bold))
                    }
                    Spacer()
                }
            }
            
            CustomImageView(imgString: "ImgContentL02"){
                VStack {
                    VStack(spacing: 4){
                        Text("Dynamic Island")
                            .foregroundColor(Color("ColorFontGray"))
                            .font(.system(size: 20))
                            .padding(.top, 40)
                        Text("iPhone을 다루는 완전히 새로운 방법.")
                            .foregroundColor(Color("ColorFontGray"))
                            .font(.system(size: 30, weight: .bold))
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                }
            }
            
            CustomImageView(imgString: "ImgContentSm01"){
                VStack {
                    Text("그 모든걸\n가능케 하는\n브레인.")
                        .foregroundLinearGradient(colors: [Color("ColorFontPurpleStart"),Color("ColorFontPurpleEnd")], startPoint: .top, endPoint: .bottom)
                        .font(.system(size: 22, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 40)
                        .padding(.leading, 37)
                    Spacer()
                }
            }
            
            CustomImageView(imgString: "ImgContentSm02"){
                VStack(spacing: 5) {
                    Text("오래 가는 배터리")
                        .foregroundLinearGradient(colors: [Color("ColorFontPurpleStart"),Color("ColorFontPurpleEnd")], startPoint: .top, endPoint: .bottom)
                        .font(.system(size: 22, weight: .bold))
                        .padding(.bottom, 9)
                    Text("온종일,")
                        .foregroundLinearGradient(colors: [Color("ColorFontPurpleStart"),Color("ColorFontPurpleEnd")], startPoint: .top, endPoint: .bottom)
                        .font(.system(size: 54, weight: .bold))
                    Text("올인.")
                        .foregroundLinearGradient(colors: [Color("ColorFontPurpleStart"),Color("ColorFontPurpleEnd")], startPoint: .top, endPoint: .bottom)
                        .font(.system(size: 54, weight: .bold))
                }
            }
            
            CustomImageView(imgString: "ImgContentL03"){
                VStack {
                    Text("상시표시형 디스플레이.\n잠긴 동안에도\n잠드는 법 없이.")
                        .foregroundLinearGradient(colors: [Color("ColorFontPurpleStart"),Color("ColorFontPurpleEnd")], startPoint: .top, endPoint: .bottom)
                        .font(.system(size: 24, weight: .bold))
                        .multilineTextAlignment(.center)
                        .padding(.top, 40)
                    Spacer()
                }
            }
            
            CustomImageView(imgString: "ImgContentL04"){
                VStack(spacing: 4) {
                    Text("Ceramic Shield")
                        .foregroundColor(Color("ColorFontGray"))
                        .font(.system(size: 20))
                        .padding(.top, 42)
                    Text("그 어떤 스마트폰\n글래스보다 견고한 소재.")
                        .foregroundLinearGradient(colors: [Color("ColorFontPurpleStart"),Color("ColorFontPurpleEnd")], startPoint: .top, endPoint: .bottom)
                        .font(.system(size: 24, weight: .bold))
                        .multilineTextAlignment(.center)
                    Spacer()
                }
            }
        }
    }
}

struct ContentAreaView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
