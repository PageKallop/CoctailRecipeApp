//
//  UIElements.swift
//  CoctailRecipeApp
//
//  Created by Page Kallop on 3/5/21.
//

import Foundation
import UIKit 

struct UIElements {
    
    
    //ViewController UIElements
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
    
    //CoctailRecipeView UIElements
    let drinkLabel: UILabel = {
    let drinkLabel = UILabel()
        //label.backgroundColor = UIColor(red: 94.12/100, green: 89.41/100, blue: 84.31/100, alpha: 1)
        drinkLabel.backgroundColor = UIColor.clear
        drinkLabel.textAlignment = .center
        drinkLabel.translatesAutoresizingMaskIntoConstraints = false
        drinkLabel.font = UIFont(name: "SnellRoundhand", size: 35)
         
        return drinkLabel
        
    }()
    
    let directionLabel: UILabel = {
    let directionLabel = UILabel()
        directionLabel.backgroundColor = UIColor.clear
        directionLabel.translatesAutoresizingMaskIntoConstraints = false
        directionLabel.font = UIFont(name: "TimesNewRoman", size: 15.0)
        directionLabel.lineBreakMode = .byWordWrapping
        directionLabel.numberOfLines = 0
        return directionLabel
    }()
    
    let glassLabel: UILabel = {
        let glassLabel = UILabel()
        glassLabel.backgroundColor = UIColor.clear
        glassLabel.textAlignment = .center
        glassLabel.translatesAutoresizingMaskIntoConstraints = false
        glassLabel.font = UIFont(name: "TimesNewRoman", size: 15.0)
        return glassLabel
    }()
    
    let ingredientLabel: UILabel = {
        let ingredientLabel = UILabel()
        ingredientLabel.frame = CGRect(x: 0, y: 0, width: ingredientLabel.intrinsicContentSize.width, height: ingredientLabel.intrinsicContentSize.height)
        ingredientLabel.backgroundColor = UIColor.clear
        ingredientLabel.translatesAutoresizingMaskIntoConstraints = false
        ingredientLabel.font = UIFont(name: "PingFang HK", size: 30)
        ingredientLabel.lineBreakMode = .byWordWrapping
        ingredientLabel.numberOfLines = 0
        ingredientLabel.sizeToFit()
      
        return ingredientLabel
    }()
    
    let measurementLabel: UILabel = {
        let measurementLabel = UILabel()
        measurementLabel.frame = CGRect(x: 0, y: 0, width: measurementLabel.intrinsicContentSize.width, height: measurementLabel.intrinsicContentSize.height)
        measurementLabel.backgroundColor = UIColor.clear
        measurementLabel.translatesAutoresizingMaskIntoConstraints = false
        measurementLabel.font = UIFont(name: "PingFang HK", size: 30)
        measurementLabel.lineBreakMode = .byWordWrapping
        measurementLabel.numberOfLines = 0
        measurementLabel.sizeToFit()
  
        
        return measurementLabel
    }()
    
}
