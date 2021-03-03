//
//  CoctailManager.swift
//  CoctailRecipeApp
//
//  Created by Page Kallop on 3/1/21.
//

import Foundation

protocol CoctailManagerDelegate {
    func didLoadRecipe(coctailManager: CoctailManager)
}

struct CoctailManager {
    
    var delegate: CoctailManagerDelegate?
  
    
 let coctailURL = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s"
    
    func getCoctail(coctailName: String) {
        
        let urlString = "\(coctailURL)=\(coctailName)"
        performRequest(with: urlString)
        print(urlString)
    }
    
    func performRequest(with urlString: String) {
      
        if let url = URL(string: urlString) {
            let session = URLSession.shared
            let task = session.dataTask(with: url) {(data, responce, error) in
                if error != nil {
                    print(error!)
                    return
                    
                }
                if let safeData = data {
                      self.parseJSON(coctailData: safeData) 
                    
                    
                }
               
            }
            task.resume()
        }
    }
    
    func parseJSON(coctailData: Data) {
   
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoctailData.self, from: coctailData)
            let drinkName = decodedData.drinks[0].strDrink
            
            print(decodedData.drinks[0].strInstructions ?? "Default")
            print(drinkName)
        } catch {
            print(error)
        }
    }
}
