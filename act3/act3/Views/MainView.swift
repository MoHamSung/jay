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
    @State var isPlusPressed = false
    @State var alarmLists = [Alarm]()
    
    var body: some View {
        List {
            // 수면|기상 ~ 알람없음까지
            Section(
                header:
                    HStack(spacing:0){
                        Text("\(Image(systemName: "bed.double.fill"))")
                            .font(.system(size: 14))
                            .foregroundColor(Color("ColorFontWhite"))
                        Text("수면 | 기상")
                            .font(.system(size: 17))
                            .foregroundColor(Color("ColorFontWhite"))
                    }){
                        HStack{
                            Text("알람 없음")
                                .font(.system(size:14))
                                .foregroundColor(Color("ColorFontGray"))
                            Spacer()
                            Button{
                                
                            } label: {
                                Text("설정")
                                    .font(.system(size:13))
                                    .foregroundColor(Color("ColorFontOrange"))
                                    .padding(.horizontal, 9)
                                    .padding(.vertical, 6)
                                    .background(Color("ColorBgGrayList"))
                                    .cornerRadius(30)
                            }
                        }
                    }
            // 기타 아래 Section
            Section(
                header:
                    HStack{
                        Text("기타")
                            .font(.system(size: 17))
                            .foregroundColor(Color("ColorFontWhite"))
                    }
            ){
                ForEach(alarmLists) { alarm in
                    AlarmComponentView(isPlusPressed: $isPlusPressed, alarm: alarm)
                    
                }
            }
        }
        .listStyle(.plain)
        .toolbar {
            Button{
                isPlusPressed.toggle()
            } label: {
                Image(systemName: "plus")
                    .foregroundColor(Color("ColorIconOrange"))
                    .padding(.vertical, 10)
                    .padding(.trailing, 16)
            }
        }
        .navigationTitle("알람")
        .sheet(isPresented: $isPlusPressed) {
            NavigationView {
                AlarmSettingView(isPlusPressed: $isPlusPressed, alarmLists: $alarmLists)
            }
        }
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .preferredColorScheme(.dark)
    }
}
