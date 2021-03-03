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
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coctailManager.delegate = self 
       
//        title = drinks[0].strDrink
        print("didnt\(drinks)")
        print("coctailM\(coctailManager)")
        view.backgroundColor = .gray
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(dismissSelf))
   
    }
    
    @objc private func dismissSelf(){
        dismiss(animated: true, completion: nil)
    }
    
    func didLoadRecipe(coctailManager: CoctailManager) {
        print(drinks[0].strDrink)
    }

}
