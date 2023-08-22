//
//  DetailView.swift
//  act6_kakaoBank
//
//  Created by Jay on 2023/08/18.
//

import SwiftUI

struct DetailView: View {
    @StateObject var navigationManager = NavigationManager.instance

    var body: some View {
        ScrollView {
            VStack{
                MyPassbookArea()
                TransactionDetailArea()
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button{
                    navigationManager.path.removeLast()
                } label: {
                    Text(Image(systemName: "chevron.left"))
                }
            }
            
            
            ToolbarItem(placement: .navigationBarTrailing) {
                
                Button{
                    
                } label: {
                    Text(Image(systemName: "gearshape"))
                    
                }
            }
        }
        .navigationTitle("카뱅")
    }
}



struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
