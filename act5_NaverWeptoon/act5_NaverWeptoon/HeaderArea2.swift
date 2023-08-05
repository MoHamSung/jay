//
//  HeaderArea2.swift
//  act5_NaverWeptoon
//
//  Created by Jay on 2023/07/09.
//

import SwiftUI

struct HeaderArea2: View {
    
    @GestureState var offset: CGFloat = 16
    @State var currentIndex: Int = 1
    @State var itemIndex: Int = 1
    let sidePadding: CGFloat = 16
    let bannerSpace: CGFloat = 10
    let itemCount = 8
    @State var headerItems = [
        HeaderItem(imageNumber: 8),
        HeaderItem(imageNumber: 1),
        HeaderItem(imageNumber: 2),
    ]
    
    var body: some View {
        GeometryReader { geo in
            let lineBannerwidth = geo.size.width - (sidePadding * 2)
            
            ZStack (alignment: .bottomLeading){
//                Image("ImgBanner0\(itemInd	ex)")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .opacity(CGFloat(16) / offset)
                Image("ImgBanner0\(1)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .opacity(CGFloat(32) / offset)
                
                HStack (spacing: bannerSpace) {
                    ForEach(headerItems) {i in
                        Image("ImgLineBanner0\(i.imageNumber)")
                            .resizable()
                            .scaledToFit()
                            .frame(width: lineBannerwidth)
                            .shadow(color: Color.black.opacity(0.34), radius: 10, x: 0, y: 2)
                    }
                }
                .offset(x: offset + (CGFloat(currentIndex) * -lineBannerwidth) - bannerSpace * CGFloat(currentIndex) )
            }
            .gesture(
                DragGesture()
                    .updating($offset, body: { value, out, _ in
                        out = value.translation.width
                    })
                    .onEnded({ value in
                        
                        let offsetX = value.translation.width

                        let progress = -offsetX / lineBannerwidth
                        
                        // 0.5를 넘기면 반올림
                        let roundIndex = progress.rounded()
                        
                        
//                        currentIndex = currentIndex + Int(roundIndex)
//                        print("currentIndex: \(currentIndex)")

                        if(roundIndex > 0){
                            itemIndex += 1
                            if itemIndex == itemCount + 1 {
                                itemIndex = 1
                            }
                            var nextitem = itemIndex + 1
                            if nextitem == itemCount + 1 {
                                nextitem = 1
//                            currentIndex = 1
                            }
                            headerItems.append(HeaderItem(imageNumber: nextitem))
                            headerItems.remove(at: 0)

                        }
                        else if(roundIndex < 0){
                            itemIndex -= 1
                            if itemIndex == 0 {
                                itemIndex = itemCount
                            }
                            var nextitem = itemIndex - 1
                            if nextitem == 0 {
                                nextitem = itemCount
                            }
                            
                            headerItems.insert(HeaderItem(imageNumber: nextitem), at: 0)
                            headerItems.remove(at: 3)
                            
//                            currentIndex = 1
                        }
                    })
            )
        }
        .animation(.easeInOut, value: offset == 16)

    }
}

struct HeaderArea2_Previews: PreviewProvider {
    static var previews: some View {
        HeaderArea2()
    }
}
