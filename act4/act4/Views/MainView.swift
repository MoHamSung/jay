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
            ProductPreview()
            
            ContentAreaView()
            
            PurchaseView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
