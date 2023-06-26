//
//  MainView.swift
//  act4
//
//  Created by Jay on 2023/06/23.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20){
                ProductPreview()
                
                ContentAreaView()
                    .background(Color("ColorBgBlack"))
                    .padding(.horizontal, 20)
            }.background(Color("ColorBgBlack"))
            PurchaseView()
            
        }
        .headerProminence(.standard)
        .ignoresSafeArea()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
