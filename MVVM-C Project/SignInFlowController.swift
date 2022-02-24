//
//  SignInFlowController.swift
//  MVVM-C Project
//
//  Created by Rezo Joglidze on 24.02.22.
//

import Foundation
import UIKit

class SignInFlowController: LoginFlowDelegate {
    
    deinit {
        print("Deinit SignInFlowController")
    }
    
    var navigationController: UINavigationController!

    func successfullyLoggedIn() {
        print("successfullyLoggedIn")
        let storyBoard = UIStoryboard(name: "Texts", bundle: nil)
        guard let view = storyBoard.instantiateViewController(withIdentifier: "TextsViewController") as? TextsViewController else { return  }
        let viewModel = TextsViewModel(textViewInterface: view)
        view.viewModel = viewModel
        self.navigationController.pushViewController(view, animated: true)
    }
    
    func failedLoggedIn() {
        print("failedLoggedIn")

    }
    
    func showLogin() -> UIViewController? {
        let storyBoard = UIStoryboard(name: "Login", bundle: nil)
        guard let view = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else { return nil }
        let viewModel = LoginViewModel(view: view, flowDelegate: self)
        view.viewModel = viewModel
        return view
    }
}
