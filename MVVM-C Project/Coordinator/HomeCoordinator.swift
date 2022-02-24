//
//  HomeCoordinator.swift
//  MVVM-C Project
//
//  Created by Rezo Joglidze on 24.02.22.
//

import Foundation
import UIKit

class HomeCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    
    var parentCoordinator: AuthCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let textsViewcontroller = TextsViewController.instatiate()
        let textsViewModel = TextsViewModel.init(view: textsViewcontroller, coordinator: self)
        textsViewcontroller.viewModel = textsViewModel
        navigationController.pushViewController(textsViewcontroller, animated: false)
    }
    
    func didFinishWork() {
        parentCoordinator?.childDidFinish(self)
    }
    
    deinit {
        print("deinit from home coordinator")
    }
}
