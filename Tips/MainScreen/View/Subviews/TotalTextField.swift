import SwiftUI

struct TotalTextField: View {
    
    var text: Binding<String>
    
    var body: some View {
        VStack(spacing: 1) {
            Text("Total amount")
                .font(.title2)
                .fontWidth(.expanded)
                .padding(.top)
            
            TextField("", text: text)
                .padding()
                .tint(.pink)
                .multilineTextAlignment(.center)
                .font(.largeTitle)
                .foregroundStyle(.pink)
                .background(Color.white.opacity(0.3))
                .cornerRadius(15)
                .padding(.horizontal)
                .keyboardType(.numberPad)
        }
    }
}
