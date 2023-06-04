//
//  AlarmSettingView.swift
//  act3
//
//  Created by Jay on 2023/06/04.
//

import SwiftUI

struct AlarmSettingView: View {
    var body: some View {
        VStack{
// TODO: - 텍스트 칸 잡아먹는 거 해결해야 함. -> 해결?
            DatePicker("김말티 바보", selection: .constant(.now), displayedComponents: .hourAndMinute)
                .datePickerStyle(.wheel)
                .labelsHidden()
         
            List {
                Text("반복")
            }
        }
        
    }
}

struct AlarmSettingView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmSettingView()
            .preferredColorScheme(.dark)
    }
}
