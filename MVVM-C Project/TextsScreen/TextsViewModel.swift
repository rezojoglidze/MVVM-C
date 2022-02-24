//
//  TextsViewModel.swift
//  MVVM-C Project
//
//  Created by Rezo Joglidze on 24.02.22.
//

import Foundation
import RxSwift

protocol TextsViewModelInterface: AnyObject {
    func viewDidDisappear()
    func loadTexts()
}

class TextsViewModel {
    
    deinit{
        print("Deinit: TextsViewModel")
    }
    
    weak var view: TextsViewInterface?
    var coordinator: HomeCoordinator?
    
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
        NetworkManager().getTexts { result in
            switch result {
            case .success(let texts):
                print(texts)
            case .failure(let error):
                print(error)
            }
        }
    }
}
