//
//  AuthCoordinator.swift
//  MVVM-C Project
//
//  Created by Rezo Joglidze on 24.02.22.
//

import Foundation
import UIKit

class AuthCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginViewController = LoginViewController.instantiate()
        let loginViewModel = LoginViewModel(view: loginViewController, coordinator: self)
        loginViewController.viewModel = loginViewModel
        navigationController.setViewControllers([loginViewController], animated: false)
    }
    
    func showTextsView() {
        let homeCoordinator = HomeCoordinator(navigationController: navigationController)
        childCoordinators.append(homeCoordinator)
        homeCoordinator.parentCoordinator = self
        homeCoordinator.start()
    }
    
    func showAlert(title: String, text: String) {
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "გასაგებია", style: .default, handler: nil)
        alert.addAction(alertAction)
//        alert.present(navigationController.presentedViewController, animated: true, completion: nil)
    }
    
    func childDidFinish(_ childCoordinator: Coordinator) {
    
        if let index = childCoordinators.firstIndex(where: { coordinator -> Bool in
            return childCoordinator === coordinator
        }) {
            childCoordinators.remove(at: index)
        }
    }
}
