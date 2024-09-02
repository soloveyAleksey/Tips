//
//  LoginView.swift
//  Tips

import SwiftUI

struct LoginView: View {
    
    @StateObject private var viewModel = LoginViewModel()
    
    private let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        NavigationStack {
            ZStack {
                GradientView(colors: [.gray, .green], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack {
                    Image("RegIcon")
                        .resizable()
                        .frame(width: screenWidth * 0.5, height: screenWidth * 0.5)
                        .foregroundStyle(.white.opacity(0.7))
                        .shadow(radius: 15)
                        .padding(.bottom)
                    
                    LoginTextField(
                        placeholder: "Email",
                        text: $viewModel.email,
                        header: viewModel.emailHeader)
                    
                    LoginTextField(
                        placeholder: "Password",
                        text: $viewModel.password,
                        header: viewModel.passwordHeader,
                        isSecure: true)
                    
                    NavigationLink(destination: MainView()) {
                        ZStack {
                            Rectangle()
                                .frame(width: screenWidth * 0.4, height: 40)
                                .foregroundStyle(
                                    viewModel.canSubmit ?
                                        .blue : .secondary.opacity(0.5))
                                .cornerRadius(10)
                            
                            Text("Login")
                                .font(.title2)
                                .bold()
                                .foregroundStyle(.white.opacity(0.7))
                        }
                    }
                    .disabled(!viewModel.canSubmit)
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    LoginView()
}
