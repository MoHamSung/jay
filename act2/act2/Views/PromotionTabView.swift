//
//  PromotionView.swift
//  act2
//
//  Created by Jay on 2023/05/21.
//

import SwiftUI

struct PromotionTabView: View {
    let itmes = [
        PromotionItem(id: 1, imageString: "", title: "", body: "", linkString: "")
    ]
    var body: some View {
        TabView {
            
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct PromotionItemView: View{
    
    var body: some View {
        HStack{
            Image(systemName: "gear")
                .resizable()
                .frame(width: 45, height: 43)
            VStack{
                
            }
        }
    }
}

struct PromotionView_Previews: PreviewProvider {
    static var previews: some View {
        PromotionTabView()
    }
}
