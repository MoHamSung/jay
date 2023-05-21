//
//  ContentView.swift
//  UIClone_Attendance
//
//  Created by Jay on 2023/04/27.
//

import SwiftUI

struct ContentView: View {
    @State var isClicked = false
    @State var flipRotation = 0.0
    @State var flipContentRotation = 0.0
    var body: some View {
        ZStack{
            //background Color
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            VStack (alignment: .leading, spacing: 0) {
                // header
                Header()
                
                // Text
                VStack(spacing: 8){
                    Text("월클 디벨로퍼 Malty.")
                        .font(.custom("SF Pro", size: 18))
                    Text("오늘도 화이팅하세요!")
                        .font(.custom("SF Pro", size: 18))
                }
                .padding(.top, 20)
                
                // Button Image View
                ZStack{
                    if !isClicked {
                        ImageView1()
                    }
                    else {
                        ImageView2()
                    }
                }
                .rotation3DEffect(.degrees(flipContentRotation), axis: (x: 0, y: 1, z: 0), perspective: 0.2)
                .onTapGesture {
                    flipImageView()
                }
                .rotation3DEffect(.degrees(flipRotation), axis: (x: 0, y: 1, z: 0), perspective: 0.2)

                // attendence Button
                AttendentButton()
                
                Spacer()
                
            }.padding(.horizontal, 25)
        }
    }
    
    func flipImageView(){
        let animationTime = 0.7
        if !isClicked {
            withAnimation(Animation.linear(duration: animationTime)){
                flipRotation -= 180
            }
        }
        else {
            withAnimation(Animation.linear(duration: animationTime)){
                flipRotation += 180
            }
        }
        withAnimation(Animation.linear(duration: 0.001).delay(animationTime / 2)){
            flipContentRotation += 180
            isClicked.toggle()
        }
        
    }
}

struct Header: View {
    var body: some View {
        HStack(spacing: 16){
            Spacer()
            Image(systemName: "calendar")
                .resizable()
                .frame(width: 28, height: 27)
            Image(systemName: "gearshape")
                .resizable()
                .frame(width: 28, height: 27)
        }
        .frame(height: 51)
        .padding(.trailing, 5)
        .foregroundColor(Color("IconColor"))
    }
}

struct ImageView1: View {
    
    var body: some View {
        ZStack{
            Rectangle()
            //  .frame(maxWidth: .infinity, maxHeight: 463)
                .frame(height: 463)
                .frame(maxWidth: .infinity)
                .cornerRadius(24)
                .foregroundColor(Color("ImageColor"))
                .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.05), radius: 17, x: 0, y: 4)
            
            VStack(spacing:0) {
                Image("character")
                    .resizable()
                    .frame(width: 152, height: 226)
                    .padding(.top, 85)
                
                VStack (spacing: 6){
                    Text("오늘은 아카데미 휴일!")
                        .font(.custom("SF Pro", size: 18))
                        .foregroundColor(.primary)
                    Text("푹 쉬고 다음에 만나요.")
                        .font(.custom("SF Pro", size: 18))
                        .foregroundColor(.primary)
                }.padding(.top, 42)
                // Text with >
                HStack(spacing: 1) {
                    Text("출석 규정 보러가기")
                        .font(.custom("SF Pro", size: 13))
                        .foregroundColor(Color("TextColor1"))
                    Image(systemName: "chevron.right")
                        .resizable()
                        .frame(width: 8, height: 12)
                        .foregroundColor(Color("TextColor1"))
                }
                .padding(.top, 16)
                .padding(.bottom, 30)
            }
            .frame(height: 463)
            .frame(maxWidth: .infinity)
        }.padding(.top, 38)
    }
    
}


struct ImageView2: View {
    var body: some View {
        
        ZStack{
            Rectangle()
            //  .frame(maxWidth: .infinity, maxHeight: 463)
                .frame(height: 463)
                .frame(maxWidth: .infinity)
                .cornerRadius(24)
                .foregroundColor(Color("ImageColor"))
                .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.05), radius: 17, x: 0, y: 4)
            
            VStack(spacing:0) {
                
                Text("한눈에 보는 출석 규정")
                    .font(.custom("SF Pro", size: 20))
                    .foregroundColor(.primary)
                    .padding(.top, 32)
                    .padding(.trailing, 130)
                
                Image("image2")
                    .resizable()
                    .frame(width: 164, height: 309)
                    .padding(.top, 34)
                    .padding(.bottom, 64)
            }
            .frame(height: 463)
            .frame(maxWidth: .infinity)
        }
        .padding(.top, 38)
    }
}

struct AttendentButton: View {
    var body: some View {
        Button{
            
        } label: {
            Text("출쓱하기")
                .font(.custom("SF Pro", size: 20))
                .frame(maxWidth: .infinity)
                .padding(.vertical, 38)
                .foregroundColor(.white)
                .background(Color("ButtonColor"))
                .cornerRadius(50)
            
            /*HStack {
                Spacer()
                Text("출쓱하기")
                Spacer()
            }
            .font(.custom("SF Pro", size: 20))
            .frame(maxWidth: .infinity)
            .padding(.vertical, 38)
            .foregroundColor(.white)
            .background(Color("ButtonColor"))
            .cornerRadius(50)
            */
        }
        .padding(.top, 30)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
