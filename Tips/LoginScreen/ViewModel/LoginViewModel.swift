//
//  ViewModel.swift
//  Tips

import Foundation
import Combine

fileprivate enum Regex: String {
    case email = "[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\\.[A-Za-z]{2,64}"
    case password = "^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z]).{8,}$"
}

final class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var canSubmit = false
    
    @Published private var emailIsValid = false 
    @Published private var passwordIsValid = false
    
    private let emailPredicate = NSPredicate(format: "SELF MATCHES %@", Regex.email.rawValue)
    private let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", Regex.password.rawValue)
    
    private var cancellables = Set<AnyCancellable>()
    
    var emailHeader: String? {
        if email.isEmpty || emailIsValid {
            return nil
        } else {
            return "Email example: test@email.com"
        }
    }
    
    var passwordHeader: String? {
        if password.isEmpty || passwordIsValid {
            return nil
        } else {
            return "The password must contain numbers, uppercase and lowercase letters"
        }
    }
    
    init() {
        $email
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map { email in
                return self.emailPredicate.evaluate(with: email)
            }
            .assign(to: \.emailIsValid, on: self)
            .store(in: &cancellables)
        
        $password
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map { password in
                return self.passwordPredicate.evaluate(with: password)
            }
            .assign(to: \.passwordIsValid, on: self)
            .store(in: &cancellables)
        
        Publishers.CombineLatest($emailIsValid, $passwordIsValid)
            .map { email, password in
                return email && password
            }
            .assign(to: \.canSubmit, on: self)
            .store(in: &cancellables)
    }
}
