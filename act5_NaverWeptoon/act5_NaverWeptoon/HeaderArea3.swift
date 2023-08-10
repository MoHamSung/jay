//
//  HeaderArea3.swift
//  act5_NaverWeptoon
//
//  Created by Jay on 2023/08/02.
//

import SwiftUI

struct HeaderArea3: View {
    /// 배너들의 스트링들을 담는 배열.
    let bannerItmes = ["1", "2", "3", "4", "5", "6", "7", "8"]
    private let spacing: CGFloat = 10
    private let trailingSpace: CGFloat = 32
    @GestureState var dragOffset: CGFloat = 0
    @State var currentIndex: Int = 2
    @State var currentItemIndex: Int = 0
    @State var nextItemIndex: Int = 0
    @State var bannerArray = [String]()
    
    var body: some View {
        GeometryReader { geo in
            let screenWidth = geo.size.width
            let width = geo.size.width - (trailingSpace - spacing)
            
            ZStack (alignment: .bottomLeading) {
                Image("ImgBanner0\(bannerItmes[nextItemIndex])")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image("ImgBanner0\(bannerItmes[currentItemIndex])")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .opacity(1.0 - abs(dragOffset)/screenWidth)
                let _ = print(1.0 - abs(dragOffset)/screenWidth)
                
                HStack(spacing: spacing) {
                    ForEach(bannerArray, id: \.self) { item in
                        Image("ImgLineBanner0\(item)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .shadow(color: Color.black.opacity(0.34), radius: 10, x: 0, y: 2)
                            .frame(width: geo.size.width - trailingSpace)
                    }
                }
                .padding(.horizontal, 16)
                .offset(x: (CGFloat(currentIndex) * -width) + dragOffset)
            }
            .onAppear(){
                initArray()
            }
            .onChange(of: dragOffset) { newValue in
                print("newValue \(newValue)")
                let count = bannerItmes.count
                if newValue > 0 {
                    nextItemIndex = (count + ((currentItemIndex - 1) % count)) % count
                }
                else if newValue < 0 {
                    nextItemIndex = (currentItemIndex + 1) % count
                }
            }
            .gesture(
                DragGesture()
                    .updating($dragOffset) { value, state, _ in
                        state = value.translation.width
                    }
                    .onEnded { value in
                        let offsetX = value.translation.width
                        let progress = -offsetX / width
                        
                        let roundIndex = progress.rounded()
                        updateArray(roundIndex)
                        
                        print(bannerArray)
                    }
            )
        }
        .animation(.default, value: dragOffset == 0)
        
    }
    
    func initArray(){
        for i in -2...2{
            let count = bannerItmes.count
            if i >= 0 {
                print("\(i) : \(i % count)")
                bannerArray.append(bannerItmes[i % count])
            }
            else {
                let adjustedIndex = (count + (i % count)) % count
                print("\(i) : \(adjustedIndex)")
                bannerArray.append(bannerItmes[adjustedIndex])
            }
        }
        print(bannerArray)
    }
    
    func updateArray(_ roundIndex: CGFloat) {
        let count = bannerItmes.count
        if roundIndex > 0 {
            currentItemIndex = (currentItemIndex + 1) % count
            let nextItemIndex = (currentItemIndex + 2) % count
            bannerArray.append(bannerItmes[nextItemIndex])
            bannerArray.remove(at: 0)
        }
        else if roundIndex < 0 {
            currentItemIndex = (count + ((currentItemIndex - 1) % count)) % count
            let nextItemIndex = (count + ((currentItemIndex - 2) % count)) % count
            bannerArray.insert(bannerItmes[nextItemIndex], at: 0)
            bannerArray.remove(at: 5)
        }
        print("currentItemIndex: \(currentItemIndex)")
    }
    
}

struct HeaderArea3_Previews: PreviewProvider {
    static var previews: some View {
        HeaderArea3()
    }
}
