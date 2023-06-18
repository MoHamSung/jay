//
//  AlarmComponentView.swift
//  act3
//
//  Created by Jay on 2023/06/04.
//

import SwiftUI

struct AlarmComponentView: View {
    @Binding var isPlusPressed: Bool
    @ObservedObject var alarm: Alarm
    
    var body: some View {
        Button{
            print("nellop")
            isPlusPressed.toggle()
            
        } label: {
            HStack{
                VStack(alignment: .leading, spacing: 0) {
                    HStack(alignment: .bottom , spacing: 0){
                        
                        Text(alarm.partOfDay)
                            .font(.system(size: 35))
                            .baselineOffset(7)
                        Text(alarm.time)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 59))
                    }
                    Text(alarm.kind)
                        .font(.system(size: 12))
                }
                .foregroundColor(Color("\(alarm.isActive ? "ColorFontWhite" : "ColorFontGray")"))
                
                Toggle(isOn: $alarm.isActive) {
                    
                }.labelsHidden()
            }
        }
    }
}

struct AlarmComponentView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmComponentView(isPlusPressed: .constant(true), alarm: Alarm( date: Date(), kind: "알람"))
            .preferredColorScheme(.dark)
    }
}
