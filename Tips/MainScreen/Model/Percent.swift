//
//  Percent.swift
//  Tips

import Foundation

struct Percent: Identifiable {
    var id = UUID()
    var percent: Int
    
    static func initialData() -> [Percent] {
        [
            Percent(percent: 0),
            Percent(percent: 5),
            Percent(percent: 10),
            Percent(percent: 15),
            Percent(percent: 20),
            Percent(percent: 25)
        ]
    }
}
