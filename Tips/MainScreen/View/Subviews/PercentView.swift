import SwiftUI

struct PercentView: View {
    
    let index: Int
    let width: CGFloat
    let height: CGFloat
    let isSelected: Bool
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .foregroundColor(isSelected ? Color.green : Color.black.opacity(0.3))
            .frame(width: width, height: height)
            .overlay(
                Text("\(index)%")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            )
    }
}
