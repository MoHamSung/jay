//
//  MainView.swift
//  act4
//
//  Created by Jay on 2023/06/23.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        ZStack{
            ScrollView {
                VStack(spacing: 20){
                    VStack(spacing: 20){
                        ProductPreview()
                        
                        ContentAreaView()
                            .padding(.horizontal, 20)
                    }
                    .background(Color("ColorBgBlack"))
                    
                    VStack(spacing: 20) {
                        MoreInformationView()
                        PurchaseView()
                        ShareView()
                    }
                    
                }
                .background(Color("ColorBgGray"))
                
            }
            .ignoresSafeArea()
            
            VStack{
                Spacer()
                NavigationButton()
                    .padding(.horizontal, 16)
                    .padding(.bottom, 70)
            }
            .ignoresSafeArea()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
