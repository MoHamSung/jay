//
//  HeaderArea.swift
//  act5_NaverWeptoon
//
//  Created by Jay on 2023/07/09.
//

import SwiftUI

struct HeaderArea: View {
    
    @GestureState var offset: CGFloat = 16
    @State var currentIndex: Int = 0
    let sidePadding: CGFloat = 16
    let bannerSpace: CGFloat = 10
    
    let headerItems = [
        HeaderItem(imageNumber: 1),
        HeaderItem(imageNumber: 2),
        HeaderItem(imageNumber: 3),
        HeaderItem(imageNumber: 4),
        HeaderItem(imageNumber: 5),
        HeaderItem(imageNumber: 6),
        HeaderItem(imageNumber: 7),
        HeaderItem(imageNumber: 8),
    ]
    
    var body: some View {
        GeometryReader { geo in
            let lineBannerwidth = geo.size.width - (sidePadding * 2)
            
            
            ZStack (alignment: .bottomLeading){
                Image("ImgBanner0\(1)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                
                HStack (spacing: bannerSpace) {
                    ForEach(headerItems) {i in
                        Image("ImgLineBanner0\(i.imageNumber)")
                            .resizable()
                            .scaledToFit()
                            .frame(width: lineBannerwidth)
                            .shadow(color: Color.black.opacity(0.34), radius: 10, x: 0, y: 2)
                        
                    }
                }
                .offset(x: offset + (CGFloat(currentIndex) * -lineBannerwidth) - bannerSpace * CGFloat(currentIndex))
//                .offset(x: offset + (CGFloat(currentIndex) * -lineBannerwidth))
            }
            .gesture(
                DragGesture()
                    .updating($offset, body: { value, out, _ in
                        out = value.translation.width
                    })
                    .onEnded({ value in
                        // value는 시작 위치와 끝나는 위치 표시,움직이는 속도도 표시
                        // translation은 width값과 hegiht값으로 볗놘
                        let offsetX = value.translation.width
//                        print("value = \(value)")
//                        print("value.translation = \(value.translation)")
                        print("value.translation.width = \(value.translation.width)")
                        
                        // ofsset이 화면의 반을 넘기면 Swipe(좌측으로 넘기면 - 우측은 +)
                        let progress = -offsetX / lineBannerwidth
                        
                        // 0.5를 넘기면 반올림
                        let roundIndex = progress.rounded()
                        
                        // 배열 에러 방지
                        currentIndex = max(min(currentIndex + Int(roundIndex), headerItems.count - 1), 0)
                    })
            )
        }
        .animation(.easeInOut, value: offset == 16)

    }
}


struct HeaderArea_Previews: PreviewProvider {
    static var previews: some View {
        HeaderArea()
    }
}


struct HeaderItem: Identifiable {
    var id = UUID()
    var imageNumber: Int
}
