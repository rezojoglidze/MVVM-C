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
    
    deinit{
        print("Deinit: TextsViewController")
    }
    
    var viewModel: TextsViewModelInterface!
    
    static func instatiate() -> TextsViewController {
        let storyBoard = UIStoryboard(name: "Texts", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "TextsViewController") as? TextsViewController ?? .init()
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadTexts()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisappear()
    }
}

extension TextsViewController: TextsViewInterface {
    
}
