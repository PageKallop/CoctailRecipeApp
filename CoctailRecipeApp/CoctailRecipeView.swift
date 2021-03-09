//
//  CoctailRecipeView.swift
//  CoctailRecipeApp
//
//  Created by Page Kallop on 3/2/21.
//

import UIKit

class CoctailRecipeView: UIViewController, UITextFieldDelegate, CoctailManagerDelegate {

    let label: UILabel = {
    let label = UILabel(frame: CGRect(x: 50, y: 100, width: 300, height: 100))
        label.backgroundColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 50)

        return label
        
    }()
    
    var coctailManager = CoctailManager()
    var theDrinks = [Drinks]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        coctailManager.delegate = self
        view.addSubview(label)
   
        view.backgroundColor = .gray
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
