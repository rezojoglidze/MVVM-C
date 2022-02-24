//
//  LoginViewModel.swift
//  MVVM-C Project
//
//  Created by Rezo Joglidze on 23.02.22.
//

import Foundation


protocol LoginViewModelInterface: AnyObject {
    func checkUserCredentials(name: String, pass: String)
}

class LoginViewModel {
    
    deinit{
        print("Deinit: LoginViewModel")
    }
    
    weak var view: LoginViewInterface?
    var coordinator: AuthCoordinator?
    
    init(view: LoginViewInterface,
         coordinator: AuthCoordinator) {
        self.view = view
        self.coordinator = coordinator
    }
}

extension LoginViewModel: LoginViewModelInterface {
    func checkUserCredentials(name: String, pass: String) {
        if name == "user" && pass == "123qwe" {
            coordinator?.showTextsView()
        } else {
            coordinator?.showAlert(title: "Error!", text: "username or passowrd isnot correct")
        }
    }
}
