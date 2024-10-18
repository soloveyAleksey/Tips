import SwiftUI

struct BackButtonView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        HStack {
            Button(action: {
                dismiss()
            }) {
                Image(systemName: "arrow.uturn.backward")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.white.opacity(0.7))
            }
            Spacer()
        }
    }
}
