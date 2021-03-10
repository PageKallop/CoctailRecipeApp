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
        drinkLabel.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 10, left: 100, bottom: 600, right: 100))
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

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor, leading: NSLayoutXAxisAnchor, bottom: NSLayoutYAxisAnchor, trailing: NSLayoutXAxisAnchor, padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        

        
        topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
    }
}
