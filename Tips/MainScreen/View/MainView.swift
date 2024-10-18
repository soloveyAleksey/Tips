//
//  MainView.swift
//  Tips

import SwiftUI

struct MainView: View {
    
    @StateObject private var viewModel = MainViewModel()
    @FocusState private var focusedField: Int?
    @State private var selectedItemIndex: Int?
    
    private let screenWidth = UIScreen.main.bounds.width
    private var keyboardPad: Int? = 0
    
    var body: some View {
        ScrollView {
            // MARK: Back button
            BackButtonView()
                .padding(.leading)
            
            LazyVStack {
                // MARK: Main Icon
                Image("MoneyBag")
                    .resizable()
                    .frame(width: screenWidth * 0.7, height: screenWidth * 0.7)
                    .shadow(radius: 20)
                
                Divider()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        // MARK: Сollection of percentages
                        ForEach(viewModel.percentages) { item in
                            PercentView(index: item.percent, width: screenWidth * 0.2, height: screenWidth * 0.2, isSelected: item.percent == selectedItemIndex)
                                .onTapGesture {
                                    withAnimation {
                                        selectedItemIndex = item.percent
                                        viewModel.percent = item.percent
                                    }
                                }
                        }
                    }.padding(.leading)
                }
                
                // MARK: Total amount TextField
                TotalTextField(text: $viewModel.amount)
                    .focused($focusedField, equals: keyboardPad)
                
                // MARK: Person count Buttons
                HStack {
                    CountButton(title: "-") {
                        if viewModel.numberOfPeople > 1 {
                            viewModel.numberOfPeople -= 1
                        }
                    }
                    
                    Spacer()
                    Text("\(viewModel.numberOfPeople)")
                        .font(.system(size: 60))
                        .bold()
                    Spacer()
                    
                    CountButton(title: "+") {
                        viewModel.numberOfPeople += 1
                    }
                }
                .padding(.horizontal)
                
                // MARK: Total amount
                VStack {
                    Text("The total amount per person:")
                        .font(.system(size: 21))
                        .bold()
                    Text("\(viewModel.totalPerPerson, specifier: "%.2f")$")
                        .font(.system(size: 50))
                        .bold()
                        .foregroundStyle(.pink)
                        .shadow(radius: 1, y: 4)
                }
                .padding(.top, 5)
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    Button("Done") {
                        focusedField = nil
                    }
                }
            }
        }
        .background(GradientView(colors: [.purple, .gray, .green], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea())
        .toolbar(.hidden)
    }
}

// MARK: - Preview
#Preview {
    NavigationStack {
        MainView()
    }
}
