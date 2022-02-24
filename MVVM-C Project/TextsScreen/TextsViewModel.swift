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
    
    weak var textViewInterface: TextsViewInterface?
    
    init(textViewInterface: TextsViewInterface) {
        self.textViewInterface = textViewInterface
    }
}

extension TextsViewModel: TextsViewModelInterface {
    
}
