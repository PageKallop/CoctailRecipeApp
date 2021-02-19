//
//  ViewController.swift
//  CoctailRecipeApp
//
//  Created by Page Kallop on 2/19/21.
//

import UIKit

class ViewController: UIViewController  {
    
    let searchBar : UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = UISearchBar.Style.prominent
        searchBar.placeholder = "Search Coctails..."
//        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
   
        view.backgroundColor = UIColor(named: "lightBlue")
        topLayout()
       
    }
    
    
    func topLayout() {
       
        let containerView = UIView()
        view.addSubview(containerView)
        containerView.backgroundColor = .white
        containerView.translatesAutoresizingMaskIntoConstraints = false
//
//        let gradient = CAGradientLayer()
//        gradient.frame = containerView.bounds
//        gradient.colors = [UIColor(named: "lightBlue")?.cgColor ?? UIColor.systemTeal.cgColor, UIColor.white.cgColor]
//        containerView.layer.insertSublayer(gradient, at: 1)
//        gradient.locations = [0.7, 0.75]
        containerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        containerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        containerView.addSubview(searchBar)
        
        searchBar.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        searchBar.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: 200).isActive = true

    }


}

