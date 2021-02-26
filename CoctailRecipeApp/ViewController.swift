//
//  ViewController.swift
//  CoctailRecipeApp
//
//  Created by Page Kallop on 2/19/21.
//

import UIKit


class ViewController: UIViewController, UIScrollViewDelegate {
    
   
    let imageView: UIImageView = {
    let imageView = UIImageView(image: #imageLiteral(resourceName: "shot"))
//        imageView.frame = CGRect(x: 5, y: 5, width: 50, height: 50)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
        
    }()
    let imageView1: UIImageView = {
        let imageView1 = UIImageView(image: #imageLiteral(resourceName: "shot"))
//        imageView1.frame = CGRect(x: 5, y: 5, width: 50, height: 50)
        imageView1.contentMode = .scaleAspectFill
        imageView1.clipsToBounds = true
        return imageView1
        
    }()
    let imageView2: UIImageView = {
        let imageView2 = UIImageView(image: #imageLiteral(resourceName: "shot"))
//        imageView2.frame = CGRect(x: 5, y: 5, width: 50, height: 50)
        imageView2.contentMode = .scaleAspectFill
        imageView2.clipsToBounds = true
        return imageView2
        
    }()
    
    let label : UILabel = {
        let label = UILabel()
    label.frame = CGRect(x: 50, y: 50, width: 50, height: 50)
        label.text = "🍸"
        return label
    }()

    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(imageView1)
        stackView.addArrangedSubview(imageView2)

            return stackView
    }()
    
    
    let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: 500, height: 0)
        scrollView.isScrollEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    
    
    let searchTextField : UITextField = {
      let searchTextField = UITextField()
        searchTextField.placeholder = "Coctail?"
        searchTextField.borderStyle = .roundedRect
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 20))
        searchTextField.leftView = paddingView
        searchTextField.rightView = paddingView
        searchTextField.leftViewMode = UITextField.ViewMode.always
        searchTextField.rightViewMode = UITextField.ViewMode.always
        searchTextField.backgroundColor = UIColor(red: 240/255, green: 230/255, blue: 140/255, alpha: 0.5)
        return searchTextField
    }()
    
    let findButton : UIButton = {
        let findButton = UIButton(frame: CGRect(x: 100, y: 100, width: 130, height: 75))
        findButton.backgroundColor = UIColor(red: 240/255, green: 230/255, blue: 140/255, alpha: 0.5)
        findButton.setTitle("Mixologist...", for: .normal)
        findButton.titleLabel?.font = UIFont(name: "SnellRoundhand", size: 25)
        findButton.setTitleColor(UIColor.black, for: .normal)
        findButton.layer.cornerRadius = 30
        findButton.addTarget(self, action: #selector(findButtonAction(sender:)), for: .touchUpInside)
        findButton.translatesAutoresizingMaskIntoConstraints = false
        
        return findButton
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
   
        self.view.addSubview(searchTextField)
        topLayout()
        bottomLayout()
     
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
    topLayout()
        UIView.animate(withDuration: 5) {
            self.label.frame = CGRect(x: 150, y: 300, width: 200, height: 20)
        }
    }
    
    @objc func findButtonAction(sender: UIButton!) {
        print("pressed")
    }
  
    func topLayout() {
       
        let containerView = UIView()
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .cyan
        containerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        containerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
    
        
        containerView.addSubview(scrollView)
        scrollView.backgroundColor = UIColor.black
        scrollView.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        
       
        
        scrollView.addSubview(stackView)
        stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true

     
}
    
    func bottomLayout() {
        let bottomContainerView = UIView()
        view.addSubview(bottomContainerView)
        bottomContainerView.translatesAutoresizingMaskIntoConstraints = false
        bottomContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bottomContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bottomContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        
        bottomContainerView.addSubview(searchTextField)
        searchTextField.topAnchor.constraint(equalTo: bottomContainerView.topAnchor, constant: 120).isActive = true
        searchTextField.leadingAnchor.constraint(equalTo: bottomContainerView.leadingAnchor,constant: 15).isActive = true
        searchTextField.bottomAnchor.constraint(equalTo: bottomContainerView.bottomAnchor,constant: -300).isActive = true
        searchTextField.trailingAnchor.constraint(equalTo: bottomContainerView.trailingAnchor, constant: -100).isActive = true
        
        bottomContainerView.addSubview(findButton)
        findButton.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 30).isActive = true
        findButton.leadingAnchor.constraint(equalTo: bottomContainerView.leadingAnchor, constant: 100).isActive = true
        findButton.bottomAnchor.constraint(equalTo: bottomContainerView.bottomAnchor, constant: -210).isActive = true
        findButton.trailingAnchor.constraint(equalTo: bottomContainerView.trailingAnchor,constant: -50).isActive = true
    }

}








