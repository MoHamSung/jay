//
//  ContentView.swift
//  act2
//
//  Created by Jay on 2023/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TitleView()
            TitleView()
        }
        .tabViewStyle(PageTabViewStyle())
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
