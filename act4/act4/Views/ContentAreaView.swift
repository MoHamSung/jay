//
//  ContentAreaView.swift
//  act4
//
//  Created by Jay on 2023/06/25.
//

import SwiftUI

struct ContentAreaView: View {
    var body: some View {
        VStack{
            Image("ImgContentL01")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .ignoresSafeArea()
            Image("ImgContentL02")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .ignoresSafeArea()
            Image("ImgContentSm01")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .ignoresSafeArea()
            Image("ImgContentSm02")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .ignoresSafeArea()
            Image("ImgContentL03")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .ignoresSafeArea()
            Image("ImgContentL04")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .ignoresSafeArea()
            
            
        }
    }
}

struct ContentAreaView_Previews: PreviewProvider {
    static var previews: some View {
        ContentAreaView()
    }
}
