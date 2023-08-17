//
//  BannerArea.swift
//  act6_kakaoBank
//
//  Created by Jay on 2023/08/11.
//

import SwiftUI

struct BannerArea: View {
    var body: some View {
        HStack {
            VStack (alignment: .leading, spacing: 5){
                Text("이번 달까지만 혜택 드려요")
                    .font(.pretendard(size: 14, .medium))
                Text("랜덤 캐시가 쏙! 신용관리 루틴 챌린지")
                    .font(.pretendard(size: 14, .semiBold))
            }
            .padding(.leading, 24)
            .padding(.vertical, 12)
            Spacer()
            Image("emoticon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 47)
                .padding(.trailing, 20)
                
        }
        .frame(maxWidth: .infinity)
        .background(Color.kakaoWhite200)
        .cornerRadius(20)
    }
}

struct BannerArea_Previews: PreviewProvider {
    static var previews: some View {
        BannerArea()
    }
}
