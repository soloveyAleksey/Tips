//
//  MainViewModel.swift
//  Tips

import Foundation

final class MainViewModel: ObservableObject {
    
    @Published var percentages = Percent.initialData()
    @Published var amount = ""
    @Published var numberOfPeople = 1
    @Published var percent = 0
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople)
        let tipSelection = Double(percent)
        let orderAmount = Double(amount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let totalAmount = orderAmount + tipValue
        let amountPerPerson = totalAmount / peopleCount
        
        return amountPerPerson
    }
}
