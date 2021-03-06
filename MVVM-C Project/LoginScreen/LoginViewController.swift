//
//  LoginViewController.swift
//  MVVM-C Project
//
//  Created by Rezo Joglidze on 23.02.22.
//

import UIKit

protocol LoginFlowDelegate: AnyObject {
    func successfullyLoggedIn()
    func failedLoggedIn()
}

protocol LoginViewInterface: AnyObject {
    
}

class LoginViewController: UIViewController {
   
    deinit{
        print("Deinit: LoginViewController" )
    }
    
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    var viewModel: LoginViewModel!

    static func instantiate() -> LoginViewController {
        let storyBoard = UIStoryboard(name: "Login", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController ?? .init()
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func checkUserCredentialsTapped(_ sender: Any) {
        viewModel.checkUserCredentials(name: usernameTextField.text ?? "", pass: passwordTextField.text ?? "")
    }
}

extension LoginViewController: LoginViewInterface {
    
}

