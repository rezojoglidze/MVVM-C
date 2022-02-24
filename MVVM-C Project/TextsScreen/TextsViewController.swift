//
//  TextsViewController.swift
//  MVVM-C Project
//
//  Created by Rezo Joglidze on 24.02.22.
//

import UIKit

protocol TextsViewInterface: AnyObject {
    
}

class TextsViewController: UIViewController {

    var viewModel: TextsViewModelInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension TextsViewController: TextsViewInterface {
    
}
