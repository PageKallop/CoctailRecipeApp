//
//  CoctailRecipeView.swift
//  CoctailRecipeApp
//
//  Created by Page Kallop on 3/2/21.
//

import UIKit

class CoctailRecipeView: UIViewController, CoctailManagerDelegate {

    
    var coctailManager = CoctailManager()
    
    var ingredientArray : [String] = []
    
    var measurementArray : [String] = []
    
    var drinks = [Drinks]()
    
    var selectedDrink : Drinks?{
        didSet {
            didLoadRecipe(coctailManager: coctailManager)
            print("ii i i \(drinks)")
        }
    }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        didLoadRecipe(coctailManager: coctailManager)
        coctailManager.delegate = self
     
        view.backgroundColor = .gray
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(dismissSelf))
   
    }
    
    @objc private func dismissSelf(){
        dismiss(animated: true, completion: nil)
    }
    
    func didLoadRecipe(coctailManager: CoctailManager) {
        DispatchQueue.main.async {
            
        }
    }

}
