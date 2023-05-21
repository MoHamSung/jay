//
//  ContentView.swift
//  act2
//
//  Created by Jay on 2023/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                TitleView()
                Divider()
                    .padding(.horizontal, 20)
                    .foregroundColor(Color("ColorDividerGray"))
                PromotionTabView()
                Divider()
                    .foregroundColor(Color("ColorDividerGray"))
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
