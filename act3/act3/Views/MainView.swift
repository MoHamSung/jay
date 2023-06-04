//
//  MainView.swift
//  act3
//
//  Created by Jay on 2023/05/31.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            NavigationBar()
            
        }
    }
}

struct NavigationBar: View{
    var body: some View {
        List {
            Section(header: Text("수면 | 기상")){
                Text("asdf")
                Text("asdf")
            }
            
            Section(header: Text("기타")){
                Text("asdf")
                Text("asdf")
            }
        }
        .listStyle(.plain)
        .toolbar {
            Image(systemName: "plus")
                .foregroundColor(Color("ColorIconOrange"))
                .padding(.vertical, 10)
                .padding(.trailing, 16)
        }
        .navigationTitle("알람")
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .preferredColorScheme(.dark)
    }
}
