//
//  ContentView.swift
//  act6_kakaoBank
//
//  Created by Jay on 2023/08/10.
//

import SwiftUI

struct ContentView: View {
    @StateObject var navigationManager = NavigationManager.instance
    
    var body: some View {
        NavigationStack(path: $navigationManager.path) {
            TabView {
                MainView()
                    .environmentObject(navigationManager)
                    .tabItem{
                        Image("ImgIcon01")
                    }
                Text("김말티 바보")
                    .tabItem{
                        Image("ImgIcon02")
                    }
                Text("김말티 바보")
                    .tabItem{
                        Image("ImgIcon03")
                    }
                Text("김말티 바보")
                    .tabItem{
                        Image("ImgIcon04")
                    }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
