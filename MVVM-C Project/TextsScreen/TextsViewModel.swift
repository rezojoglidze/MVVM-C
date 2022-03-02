//
//  TextsViewModel.swift
//  MVVM-C Project
//
//  Created by Rezo Joglidze on 24.02.22.
//

import Foundation

protocol TextsViewModelInterface: AnyObject {
    func viewDidDisappear()
    func loadTexts()
    var items: [String] { get }
}

class TextsViewModel {
    
    deinit{
        print("Deinit: TextsViewModel")
    }
    
    weak var view: TextsViewInterface?
    var coordinator: HomeCoordinator?
    var items: [String] = []
    
    init(view: TextsViewInterface,
         coordinator: HomeCoordinator) {
        self.view = view
        self.coordinator = coordinator
    }
}

extension TextsViewModel: TextsViewModelInterface {
    func viewDidDisappear() {
        coordinator?.didFinishWork()
    }
    
    func loadTexts() {
        NetworkManager.shared.getTexts {[weak self] result in
            switch result {
            case .success(let texts):
                self?.items = texts
                DispatchQueue.main.sync {
                    self?.view?.reloadData()
                }
            case .failure(let error):
                self?.coordinator?.showAlert(title: "Error", text: error.localizedDescription)
            }
        }
    }
}
