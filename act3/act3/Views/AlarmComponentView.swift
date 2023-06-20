//
//  AlarmComponentView.swift
//  act3
//
//  Created by Jay on 2023/06/04.
//

import SwiftUI

struct AlarmComponentView: View {
    @StateObject var alarm: Alarm
    
    var body: some View {
        
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
