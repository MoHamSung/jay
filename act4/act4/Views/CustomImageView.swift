//
//  CustomImageView.swift
//  act4
//
//  Created by Jay on 2023/06/26.
//

import SwiftUI

struct CustomImageView<Content>: View where Content: View {
    let imgString: String
    @ViewBuilder let content: Content
    
    var body: some View {
        Image(imgString)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity)
            .overlay {
                content
            }
    }
}

struct CustomImageView_Previews: PreviewProvider {
    static var previews: some View {
        CustomImageView(imgString: "ImgContentL01"){
            
        }
    }
}
