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
    
    deinit {
        print("Deinit LoginViewModel")
    }
    
    weak var view: LoginViewInterface?
     var flowDelegate: LoginFlowDelegate?
    
    init(view: LoginViewInterface,
         flowDelegate: LoginFlowDelegate) {
        self.view = view
        print("flowDelegate = ", flowDelegate)
        self.flowDelegate = flowDelegate
    }
}

extension LoginViewModel: LoginViewModelInterface {
    func checkUserCredentials(name: String, pass: String) {
        if name == "user" && pass == "123qwe" {
            print("flowDelegate?.successfullyLoggedIn()-> ", flowDelegate)
            flowDelegate?.successfullyLoggedIn()
        } else {
            flowDelegate?.failedLoggedIn()
        }
    }
}
