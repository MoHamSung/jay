//
//  ListView.swift
//  act6_kakaoBank
//
//  Created by Jay on 2023/08/23.
//

import SwiftUI

struct ListView: View {
    
    var body: some View {
        VStack(spacing: 0) {
            
            ListHeaderArea()
                
            ListArea()
                
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
