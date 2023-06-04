//
//  AlarmSettingView.swift
//  act3
//
//  Created by Jay on 2023/06/04.
//

import SwiftUI

struct AlarmSettingView: View {
    @Binding var isPlusPressed: Bool
    
    var body: some View {
        VStack{
            // TODO: - 텍스트 칸 잡아먹는 거 해결해야 함. -> 해결?
            DatePicker("김말티 바보", selection: .constant(.now), displayedComponents: .hourAndMinute)
                .datePickerStyle(.wheel)
                .labelsHidden()
            
            List {
                AlarmOptionView(title: "반복") {
                    Text("안함")
                        .font(.system(size: 15))
                        .foregroundColor(Color("ColorFontGray"))
                    Image(systemName: "chevron.right")
                        .font(.system(size: 12))
                        .foregroundColor(Color("ColorFontGray"))
                }
                AlarmOptionView(title: "레이블") {
                    Text("알람")
                        .font(.system(size: 15))
                        .foregroundColor(Color("ColorFontDarkGray"))
                }
                AlarmOptionView(title: "레이블") {
                    Text("녹차")
                        .font(.system(size: 15))
                        .foregroundColor(Color("ColorFontGray"))
                    Image(systemName: "chevron.right")
                        .font(.system(size: 12))
                        .foregroundColor(Color("ColorFontGray"))
                }
                AlarmOptionView(title: "다시 알림") {
                    Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                    }
                }
            }
        }
        .navigationTitle(Text("알람 추가").font(.system(size: 16,weight: .bold)))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .cancellationAction){
                Button {
                    isPlusPressed.toggle()
                }label: {
                    Text("취소")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(Color("ColorFontOrange"))
                }
            }
            ToolbarItem(placement: .confirmationAction){
                Button {
                    isPlusPressed.toggle()
                }label: {
                    Text("저장")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(Color("ColorFontOrange"))
                }
            }
        }
    }
}

struct AlarmOptionView<Content>: View where Content: View {
    let title: String
    @ViewBuilder let content: Content
    
    var body: some View {
        HStack(spacing: 5) {
            Text(title)
                .font(.system(size: 15))
            Spacer()
            content
        }
    }
}

struct AlarmSettingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AlarmSettingView(isPlusPressed: .constant(true))
                .preferredColorScheme(.dark)
        }
    }
}
