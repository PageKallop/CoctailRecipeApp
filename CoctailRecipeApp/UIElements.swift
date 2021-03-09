//
//  UIElements.swift
//  CoctailRecipeApp
//
//  Created by Page Kallop on 3/5/21.
//

import Foundation
import UIKit 

struct UIElements {
    
    let imageView: UIImageView = {
    let imageView = UIImageView(image: #imageLiteral(resourceName: "shot"))
//        imageView.frame = CGRect(x: 5, y: 5, width: 50, height: 50)
        
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = imageView.frame.size.height/5
        imageView.clipsToBounds = true
        return imageView
        
    }()
    let imageView1: UIImageView = {
        let imageView1 = UIImageView(image: #imageLiteral(resourceName: "shot"))
//        imageView1.frame = CGRect(x: 5, y: 5, width: 50, height: 50)
        imageView1.contentMode = .scaleAspectFill
        imageView1.layer.cornerRadius = imageView1.frame.size.height/5
        imageView1.clipsToBounds = true
        return imageView1
        
    }()
    let imageView2: UIImageView = {
        let imageView2 = UIImageView(image: #imageLiteral(resourceName: "shot"))
//        imageView2.frame = CGRect(x: 5, y: 5, width: 50, height: 50)
        
        imageView2.contentMode = .scaleAspectFill
        imageView2.layer.cornerRadius = imageView2.frame.size.height/5
        imageView2.clipsToBounds = true
        return imageView2
        
    }()
    
    let bar : UIImageView = {
        let martini = UIImageView(image: #imageLiteral(resourceName: "500_F_259311032_KWupNx0SbrWLaBZHeGpDT3krtxC7PkCZ"))
        martini.frame = CGRect(x: 100, y: 100, width: 50, height: 50)
        return martini
    }()

    
//    lazy var stackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.axis = .horizontal
//        stackView.spacing = 15
//        stackView.alignment = .fill
//        stackView.distribution = .fillEqually
////        stackView.addArrangedSubview(imageView)
////        stackView.addArrangedSubview(imageView1)
////        stackView.addArrangedSubview(imageView2)
//
//            return stackView
//    }()
    
    
    let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: 500, height: 0)
        scrollView.isScrollEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    
    
    let searchTextField : UITextField = {
      let searchTextField = UITextField()
        searchTextField.text = "margarita"
        searchTextField.placeholder = "Coctail?"
        searchTextField.borderStyle = .roundedRect
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 20))
        searchTextField.leftView = paddingView
        searchTextField.rightView = paddingView
        searchTextField.leftViewMode = UITextField.ViewMode.always
        searchTextField.rightViewMode = UITextField.ViewMode.always
        searchTextField.backgroundColor = UIColor(red: 255/255, green: 130/255, blue: 113/255, alpha: 0.2)
        return searchTextField
    }()
    
    let findButton : UIButton = {
        let findButton = UIButton(frame: CGRect(x: 100, y: 100, width: 130, height: 75))
        findButton.backgroundColor = UIColor(red: 255/255, green: 130/255, blue: 113/255, alpha: 0.2)
        findButton.setTitle("Mixologist...", for: .normal)
        findButton.titleLabel?.font = UIFont(name: "SnellRoundhand", size: 25)
        findButton.setTitleColor(UIColor.black, for: .normal)
        findButton.layer.cornerRadius = 20
        findButton.translatesAutoresizingMaskIntoConstraints = false
        
        return findButton
    }()
    
}
