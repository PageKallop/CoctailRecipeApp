//
//  ViewController.swift
//  CoctailRecipeApp
//
//  Created by Page Kallop on 2/19/21.
//

import UIKit


class ViewController: UIViewController, UIScrollViewDelegate, UITextFieldDelegate, CoctailManagerDelegate {
    
    //creates stack view
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.alignment = .fill
        stackView.distribution = .fillEqually

            return stackView
    }()
    
    var coctailManager = CoctailManager()

    //adds elements from ui library
    var imageView = UIElements().imageView
    var imageView1 = UIElements().imageView1
    var imageView2 = UIElements().imageView2
    var scrollView  = UIElements().scrollView
    var findButton = UIElements().findButton
    var bar = UIElements().bar 
    var searchTextField = UIElements().searchTextField
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardDidHideNotification, object: nil)
      
//        self.dismissKeyBoard()
 
        //sets delegate
        coctailManager.delegate = self
        
        searchTextField.delegate = self
        
        view.backgroundColor = UIColor.white
        //adds textfield to view
        self.view.addSubview(searchTextField)
        topLayout()
        bottomLayout()
        findButton.addTarget(self, action: #selector(findButtonAction(_ :)), for: .touchUpInside)
        
       
    }
    //adjusts view to keyoboard
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else {return}
        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
        let keyboardFrame = keyboardSize.cgRectValue
        if self.view.frame.origin.y == 0 {
            self.view.frame.origin.y -= keyboardFrame.height
        }
        
    }
    @objc func keyboardWillHide(notification: NSNotification) {

        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
        
    }
    
    func dismissKeyBoard(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboardTouchingOutside))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc private func dismissKeyboardTouchingOutside(){
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        
        
        topLayout()
     
    }
    //creates button functionality
    @objc func findButtonAction(_ sender: UIButton!) {
  
        searchTextField.endEditing(true)
  
    }
    
    //creates textfield methods to check text field and send information search quiery
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if searchTextField.text != "" {
            return true
        } else {
            searchTextField.placeholder = "Type a coctail"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
       

        let drink = searchTextField.text
        
        let coctail = drink!.trimmingCharacters(in: .whitespaces).replacingOccurrences(of: " ", with: "%20")
        print(coctail)

        coctailManager.getCoctail(coctailName: coctail)

        searchTextField.text = ""
    }
    
  //adds elements to top half of view
    func topLayout() {
       
        let containerView = UIView()
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = UIColor(red: 94.12/255, green: 84.41/255, blue: 84.31/255, alpha: 0.1)
        containerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        containerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true

        containerView.addSubview(scrollView)
        scrollView.backgroundColor = UIColor.clear
        scrollView.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor,constant: 20).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: containerView.centerYAnchor, constant: -25).isActive = true
        
       
        
        scrollView.addSubview(stackView)
        stackView.backgroundColor = UIColor.clear
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(imageView1)
        stackView.addArrangedSubview(imageView2)
        stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
        let animationView = UIView()
        containerView.addSubview(animationView)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.topAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        animationView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        animationView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        animationView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        animationView.backgroundColor = UIColor.clear
        animationView.addSubview(bar)
        bar.translatesAutoresizingMaskIntoConstraints = false
        bar.topAnchor.constraint(equalTo: animationView.topAnchor,constant: 15).isActive = true
        bar.leadingAnchor.constraint(equalTo: animationView.leadingAnchor).isActive = true
        bar.trailingAnchor.constraint(equalTo: animationView.trailingAnchor).isActive = true
        bar.bottomAnchor.constraint(equalTo: animationView.bottomAnchor, constant: -15).isActive = true
        
        
      //creates animation
        UIView.animate(withDuration: 0.5) {
            
           self.bar.center.x -= containerView.bounds.width
            self.bar.frame.origin.x -= self.bar.frame.size.width
        }

     
}
    //adds elements to bottom half of view
    func bottomLayout() {
        let bottomContainerView = UIView()
        view.addSubview(bottomContainerView)
        bottomContainerView.backgroundColor = UIColor(red: 94.12/255, green: 84.41/255, blue: 84.31/255, alpha: 0.2)
        bottomContainerView.translatesAutoresizingMaskIntoConstraints = false
        bottomContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bottomContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bottomContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
 
        bottomContainerView.addSubview(searchTextField)
        searchTextField.topAnchor.constraint(equalTo: bottomContainerView.topAnchor, constant: 75).isActive = true
        searchTextField.leadingAnchor.constraint(equalTo: bottomContainerView.leadingAnchor,constant: 25).isActive = true
        searchTextField.bottomAnchor.constraint(equalTo: bottomContainerView.bottomAnchor,constant: -300).isActive = true
        searchTextField.trailingAnchor.constraint(equalTo: bottomContainerView.trailingAnchor, constant: -25).isActive = true
        
        bottomContainerView.addSubview(findButton)
        findButton.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 150).isActive = true
        findButton.leadingAnchor.constraint(equalTo: bottomContainerView.leadingAnchor, constant: 30).isActive = true
        findButton.bottomAnchor.constraint(equalTo: bottomContainerView.bottomAnchor, constant: -100).isActive = true
        findButton.trailingAnchor.constraint(equalTo: bottomContainerView.trailingAnchor, constant: -30).isActive = true
    }
    //protocol that handles when data is returned
    func didLoadRecipe(_ coctailManager: CoctailManager, coctailRecipe: CoctailModel) {
        
        DispatchQueue.main.async {
            let recipeVC = CoctailRecipeView()
            let navVC = UINavigationController(rootViewController: recipeVC)
            navVC.modalPresentationStyle = .fullScreen
            self.present(navVC, animated: true)
            //send data to coctail recipe vc
            recipeVC.drinkLabel.text = coctailRecipe.coctailName
            recipeVC.glassLabel.text = "- \(coctailRecipe.glassType ?? "glass")"
            recipeVC.directionLabel.text = coctailRecipe.instructions

            //sorts the data returned
            let list = coctailRecipe.ingredient.compactMap { $0 }
            let ingredientList = list.map { "\($0)" }.joined(separator: "\n\n")
            
            let measurments = coctailRecipe.measurements.compactMap { $0 }
            let measurmentList = measurments.map { "\($0)" }.joined(separator: "\n\n")
            
            //send data to coctail recipe vc
            recipeVC.ingredientLabel.text = ingredientList
            recipeVC.measurementLabel.text = measurmentList
            
   
            print(ingredientList)
            print("all \(coctailRecipe.coctailName)")
        }
        
     
        print("did\(coctailRecipe.coctailName)")
    }
    
    func didFailWithError(error: Error) {
        print("vc fail")
    }

}








