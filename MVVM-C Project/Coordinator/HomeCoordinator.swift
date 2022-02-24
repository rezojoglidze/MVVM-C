//
//  HomeCoordinator.swift
//  MVVM-C Project
//
//  Created by Rezo Joglidze on 24.02.22.
//

import Foundation
import UIKit

class HomeCoordinator: Coordinator {
    private(set) var childCoordinator: [Coordinator] = []
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let textsViewcontroller = TextsViewController.instatiate()
        let textsViewModel = TextsViewModel.init(view: textsViewcontroller)
        textsViewcontroller.viewModel = textsViewModel
        navigationController.pushViewController(textsViewcontroller, animated: false)
    }
}
