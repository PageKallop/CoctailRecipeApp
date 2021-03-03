//
//  CoctailRecipeView.swift
//  CoctailRecipeApp
//
//  Created by Page Kallop on 3/2/21.
//

import UIKit

class CoctailRecipeView: UIViewController {

    
    var coctailManager = CoctailManager()
    
    var ingredientArray : [String] = []
    
    var measurementArray : [String] = []
    
    var drinks = [Drinks]()
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
//        title = drinks[0].strDrink
        print("didnt\(drinks)")
        view.backgroundColor = .gray
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(dismissSelf))
   
    }
    
    @objc private func dismissSelf(){
        dismiss(animated: true, completion: nil)
    }

}
