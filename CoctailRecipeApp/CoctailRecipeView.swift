//
//  CoctailRecipeView.swift
//  CoctailRecipeApp
//
//  Created by Page Kallop on 3/2/21.
//

import UIKit

class CoctailRecipeView: UIViewController, UITextFieldDelegate, CoctailManagerDelegate {

    //UIElements from library 
    var coctailManager = CoctailManager()
    var theDrinks = [Drinks]()
    var drinkLabel = UIElements().drinkLabel
    var directionLabel = UIElements().directionLabel
    var glassLabel = UIElements().glassLabel
    var ingredientLabel = UIElements().ingredientLabel
    var measurementLabel = UIElements().measurementLabel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let measurementView = UIView()
        let ingredientView = UIView()
        

        coctailManager.delegate = self
        navigationController?.navigationBar.barTintColor = UIColor(red: 94.12/100, green: 89.41/100, blue: 84.31/100, alpha: 1)
        
        view.addSubview(drinkLabel)
        view.addSubview(glassLabel)
        view.addSubview(ingredientLabel)
        view.addSubview(directionLabel)
        
        view.addSubview(ingredientView)
        ingredientView.addSubview(ingredientLabel)
//        ingredientView.backgroundColor = UIColor(red: 238/255, green: 235/255, blue: 211/255, alpha: 1)
//        
        view.addSubview(measurementView)
        measurementView.addSubview(measurementLabel)
//        measurementView.backgroundColor = UIColor(red: 238/255, green: 235/255, blue: 211/255, alpha: 1)
//
   
        view.backgroundColor = UIColor(red: 94.12/100, green: 89.41/100, blue: 84.31/100, alpha: 1)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(dismissSelf))
        drinkLabel.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: glassLabel.topAnchor, trailing: view.trailingAnchor, padding: .init(top: 100, left: 10, bottom: 20, right: 10))
        
        glassLabel.anchor(top: drinkLabel.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 20, left: 10, bottom: 695, right: 10))
        
        ingredientView.anchor(top: glassLabel.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: measurementView.trailingAnchor, padding: .init(top: 20, left: 25, bottom: 400, right: 0))
        
        measurementView.anchor(top: glassLabel.bottomAnchor, leading: ingredientView.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 20, left: 175, bottom: 400, right: 25))
       
        directionLabel.anchor(top: measurementView.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 15, left: 25, bottom: 100, right: 25))
        
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
