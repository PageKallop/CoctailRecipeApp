//
//  CoctailRecipeView.swift
//  CoctailRecipeApp
//
//  Created by Page Kallop on 3/2/21.
//

import UIKit

class CoctailRecipeView: UIViewController, CoctailManagerDelegate {
 
    

    var coctailManager = CoctailManager()

    
//    var drinks = [Drinks]()
    
    let label: UILabel = {
    let label = UILabel(frame: CGRect(x: 50, y: 100, width: 100, height: 100))
        label.backgroundColor = UIColor.red
        label.font = UIFont.boldSystemFont(ofSize: 50)
        
        
        return label
        
    }()
    
 
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(label)
        coctailManager.delegate = self
      
        view.backgroundColor = .gray
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(dismissSelf))
   
    }
    
    @objc private func dismissSelf(){
        dismiss(animated: true, completion: nil)
    }
    
    func didLoadRecipe(coctailManager: CoctailManager, coctailRecipe: CoctailModel) {
        DispatchQueue.main.async {
            self.label.text = coctailRecipe.coctailName
            print("i i i i i i i i i\(coctailRecipe.coctailName)")
        }
    
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }

}
