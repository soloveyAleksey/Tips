import SwiftUI

// MARK: - TextField Style
struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        return configuration
            .textFieldStyle(.plain)
            .padding(.horizontal, 8)
            .frame(height: 45)
            .cornerRadius(10)
            .foregroundColor(.white)
            .tint(.pink)
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)
    }
}

// MARK: - TextField View
struct LoginTextField: View {
    
    var placeholder: String
    var text: Binding<String>
    var header: String?
    var isSecure = false
    
    init(placeholder: String, text: Binding<String>, header: String? = nil, isSecure: Bool = false) {
        self.placeholder = placeholder
        self.text = text
        self.header = header
        self.isSecure = isSecure
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            if isSecure {
                SecureField(placeholder, text: text)
                    .textFieldStyle(CustomTextFieldStyle())
                    .background(header == nil ? Color.white.opacity(0.3) : Color.red.opacity(0.3))
                    .cornerRadius(10)
            } else {
                TextField(placeholder, text: text)
                    .textFieldStyle(CustomTextFieldStyle())
                    .background(header == nil ? Color.white.opacity(0.3) : Color.red.opacity(0.3))
                    .cornerRadius(10)
            }
            
            if let header = header {
                Text(header)
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundStyle(.red)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
