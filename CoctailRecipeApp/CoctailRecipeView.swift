//
//  CoctailRecipeView.swift
//  CoctailRecipeApp
//
//  Created by Page Kallop on 3/2/21.
//

import UIKit

class CoctailRecipeView: UIViewController, UITextFieldDelegate, CoctailManagerDelegate {

    
    var coctailManager = CoctailManager()
    var theDrinks = [Drinks]()
    var drinkLabel = UIElements().drinkLabel
    
    override func viewDidLoad() {
        super.viewDidLoad()

        coctailManager.delegate = self
        navigationController?.navigationBar.barTintColor = UIColor(red: 94.12/100, green: 89.41/100, blue: 84.31/100, alpha: 1)
        
        view.addSubview(drinkLabel)
   
        view.backgroundColor = UIColor(red: 94.12/100, green: 89.41/100, blue: 84.31/100, alpha: 1)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(dismissSelf))
    }
    
    
    @objc private func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
    
    
    func didLoadRecipe(_ coctailManager: CoctailManager, coctailRecipe: CoctailModel) {

    }

    func didFailWithError(error: Error) {
        print(error)
    }

}
