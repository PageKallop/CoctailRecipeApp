//
//  CoctailRecipeView.swift
//  CoctailRecipeApp
//
//  Created by Page Kallop on 3/2/21.
//

import UIKit

class CoctailRecipeView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Hey"
        view.backgroundColor = .gray
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Dismiss", style: .plain, target: self, action: #selector(dismissSelf))

    }
    
    @objc private func dismissSelf(){
        dismiss(animated: true, completion: nil)
    }

}
