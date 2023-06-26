//
//  ShareView.swift
//  act4
//
//  Created by Jay on 2023/06/26.
//

import SwiftUI

struct ShareView: View {
    var body: some View {
        VStack{
            Button {
                print("김말티 공유~")
            } label: {
                HStack (spacing: 10){
                    Image(systemName: "square.and.arrow.up")
                    Text("공유하기")
                }
                .font(.system(size: 14, weight: .semibold))
                .padding(EdgeInsets(top: 11, leading: 25, bottom: 10, trailing: 25))
                .background(Color("ColorBgWhite"))
                .cornerRadius(10)
            }
            .padding(.vertical, 20)
            
            VStack{
              Text("1. iPhone 14 Pro 및 iPhone 14 Pro Max는 IEC 규격 60529하의 IP68 (이 문구를 발견하고 톡방에 올리면, 엠선생님의 NearMe 무료 음료수 이용권 증정)")
                    .frame(maxWidth: .infinity)
                    .font(.system(size: 10))
                    .foregroundColor(Color("ColorFontDarkGray"))
                    .padding(.top, 60)
                    .padding(.bottom, 40)
            }
            .padding(.horizontal, 10)
            
        }
        .frame(maxWidth: .infinity)
        .background(Color("ColorBgGray"))
        
    }
}

struct ShareView_Previews: PreviewProvider {
    static var previews: some View {
        ShareView()
    }
}
