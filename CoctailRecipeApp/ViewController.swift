//
//  ViewController.swift
//  CoctailRecipeApp
//
//  Created by Page Kallop on 2/19/21.
//

import UIKit

class ViewController: UIViewController  {

    let searchTextField : UITextField = {
      let searchTextField = UITextField()
        searchTextField.placeholder = "Find Your Coctail..."
        searchTextField.borderStyle = .roundedRect
//        searchTextField.layer.cornerRadius = searchTextField.frame.size.height / 2
//        searchTextField.layer.borderWidth = 0.80
//        searchTextField.layer.borderColor = UIColor.white.cgColor
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.layer.shadowOpacity = 1
        searchTextField.layer.shadowRadius = 3.0
        searchTextField.layer.shadowOffset = CGSize.zero
        searchTextField.layer.shadowColor = UIColor.black.cgColor
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 35))
        searchTextField.leftView = paddingView
        searchTextField.rightView = paddingView
        searchTextField.leftViewMode = UITextField.ViewMode.always
        searchTextField.rightViewMode = UITextField.ViewMode.always
        searchTextField.layer.borderColor = UIColor.black.withAlphaComponent(0.25).cgColor
        searchTextField.layer.shadowOffset = CGSize(width: 0, height: 3)
        searchTextField.layer.shadowColor = UIColor.black.cgColor
        return searchTextField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "lightBlue")
        topLayout()

    }
    
    
    func topLayout() {
       
        let containerView = UIView()
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
 
        containerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        containerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        containerView.addSubview(searchTextField)
        searchTextField.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 200).isActive = true
        searchTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15).isActive = true
        searchTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15).isActive = true
        searchTextField.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -200).isActive = true
    

    }



}

