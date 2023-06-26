//
//  PurchaseView.swift
//  act4
//
//  Created by Jay on 2023/06/25.
//

import SwiftUI

struct PurchaseView: View {
    var body: some View {
        VStack{
            Image("ImgProduct01")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .ignoresSafeArea()
            Button {
                
            } label:
            {
                Image("shareBtn")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .ignoresSafeArea()
            }
            Image("infoBtn")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .ignoresSafeArea()
        }
    }
}

struct PurchaseView_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseView()
    }
}
