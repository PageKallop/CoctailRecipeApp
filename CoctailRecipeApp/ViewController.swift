//
//  ViewController.swift
//  CoctailRecipeApp
//
//  Created by Page Kallop on 2/19/21.
//

import UIKit

class ViewController: UIViewController {
    
    let containerView: UIView = {
        let screenSize: CGRect = UIScreen.main.bounds
        let vc = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height))
        let gradient = CAGradientLayer()
        gradient.frame = vc.bounds
        gradient.colors = [UIColor.white.cgColor, UIColor.black.cgColor]
        vc.layer.insertSublayer(gradient, at: 0)
        return vc
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = containerView
        // Do any additional setup after loading the view.
    }


}

