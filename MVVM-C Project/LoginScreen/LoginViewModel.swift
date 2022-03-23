//
//  LoginViewModel.swift
//  MVVM-C Project
//
//  Created by Rezo Joglidze on 23.02.22.
//

import Foundation
import UIKit

protocol LoginViewModelInterface: AnyObject {
    func checkUserCredentials(name: String, pass: String)
}

class LoginViewModel {
    
    deinit{
        print("Deinit: LoginViewModel")
    }
    
    weak var view: LoginViewInterface?
    var coordinator: AuthCoordinator?
    var password: String = ""
    var email: String = ""

    init(view: LoginViewInterface,
         coordinator: AuthCoordinator) {
        self.view = view
        self.coordinator = coordinator
    }
}

extension LoginViewModel: LoginViewModelInterface {
    func checkUserCredentials(name: String, pass: String) {
        self.email = name
        self.password = pass
        if name == "user" && pass == "123qwe" {
            coordinator?.showTextsView()
        } else {
            coordinator?.showAlert(title: "Error!", text: "username or passowrd isnot correct")
        }
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isValidPassword() -> String? {
        if self.password.count <= 1 {
            return "Please, enter a password"
        }
        
        if password.count < 6 {
            return "Password must not be shorter than 6 characters"
        }
        
        if !NSPredicate(format: "SELF MATCHES %@", ".*[A-Z]+.*").evaluate(with: password) {
            return "Password must contain at least one uppercase letter"
        }
        
        if !NSPredicate(format: "SELF MATCHES %@", ".*[a-z]+.*").evaluate(with: password) {
            return "Password must contain at least one lowercase letter"
        }
        
        if !NSPredicate(format: "SELF MATCHES %@", ".*[0-9]+.*").evaluate(with: password) {
            return "Password must contain at least one number"
        }
        
        return nil
    }
}
