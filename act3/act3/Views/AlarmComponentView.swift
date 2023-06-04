//
//  AlarmComponentView.swift
//  act3
//
//  Created by Jay on 2023/06/04.
//

import SwiftUI

struct AlarmComponentView: View {
//    @State var isToggleOn = false
    let alarm: Alarm
    
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 0) {
                HStack(alignment: .bottom , spacing: 0){
                    
                    Text(alarm.partOfDay)
                        .font(.system(size: 35))
                        .foregroundColor(Color("ColorFontWhite"))
                        .baselineOffset(7)
                    //                    .border(.red)
                    Text(alarm.time)
                        .font(.system(size: 59))
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color("ColorFontWhite"))
                    //                    .border(.red)
                }
                Text(alarm.kind)
                    .font(.system(size: 12))
                    .foregroundColor(Color("ColorFontWhite"))
                //                .border(.red)
            }
            //        .border(.blue)
            Spacer()
            Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                
            }
        }
        
    }
}

struct AlarmComponentView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmComponentView(alarm: Alarm(id:0, date: Date(), kind: "알람"))
            .preferredColorScheme(.dark)
    }
}
