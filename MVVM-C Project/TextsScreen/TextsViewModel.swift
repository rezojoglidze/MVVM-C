//
//  TextsViewModel.swift
//  MVVM-C Project
//
//  Created by Rezo Joglidze on 24.02.22.
//

import Foundation

protocol TextsViewModelInterface: AnyObject {
    
}

class TextsViewModel {
    
    weak var view: TextsViewInterface?
    
    init(view: TextsViewInterface) {
        self.view = view
    }
}

extension TextsViewModel: TextsViewModelInterface {
    
}
