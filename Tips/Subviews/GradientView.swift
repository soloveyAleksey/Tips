import SwiftUI

struct GradientView: View {
    
    var colors: [Color]
    var startPoint: UnitPoint
    var endPoint: UnitPoint
    
    var body: some View {
        LinearGradient(colors: colors, startPoint: startPoint, endPoint: endPoint)
    }
}
