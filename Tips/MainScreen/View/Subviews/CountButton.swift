import SwiftUI

struct CountButton: View {
    
    let title: String
    let action: () -> ()
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            ZStack {
                Circle()
                
                Text(title)
                    .foregroundStyle(.white)
                    .font(.system(size: 50))
                    .bold()
            }
            
        })
        .frame(width: 60, height: 60)
        .foregroundStyle(.black.opacity(0.3))
        .clipShape(Circle())
    }
}
