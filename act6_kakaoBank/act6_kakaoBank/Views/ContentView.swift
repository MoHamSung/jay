//
//  ContentView.swift
//  act6_kakaoBank
//
//  Created by Jay on 2023/08/10.
//

import SwiftUI

struct ContentView: View {
    @State private var presentedViews = ["MainView", "DetailView", "LoanView", "LoanCompleteView", "ListView", "TransferView", "TransferCompleteView"]
    
    var body: some View {
        NavigationStack {
            TabView {
                MainView()
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
        .navigationDestination(for: [String].self) { view in
            MainView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
