//
//  Alarm.swift
//  act3
//
//  Created by Jay on 2023/06/04.
//

import Foundation

class Alarm: Identifiable, ObservableObject {
    let id = UUID()
    let kind: String
    var date: Date
    var partOfDay: String
    var time: String
    @Published var isActive: Bool
    
    init(date: Date, kind: String) {
        let dateFormatter = DateFormatter()
        
        self.date = date
        self.kind = kind
        
        dateFormatter.dateFormat = "a"
        partOfDay = dateFormatter.string(from: date)
        
        dateFormatter.dateFormat = "h:mm"
        time = dateFormatter.string(from: date)
        
        isActive = true
    }
    
    func updateDate(date: Date){
        if (self.date != date){
            isActive = true
        }
        
        let dateFormatter = DateFormatter()
        self.date = date
        
        dateFormatter.dateFormat = "a"
        partOfDay = dateFormatter.string(from: date)
        
        dateFormatter.dateFormat = "h:mm"
        time = dateFormatter.string(from: date)
        
    }
    
    
}

