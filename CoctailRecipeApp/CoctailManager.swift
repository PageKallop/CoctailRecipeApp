//
//  CoctailManager.swift
//  CoctailRecipeApp
//
//  Created by Page Kallop on 3/1/21.
//

import Foundation

protocol CoctailManagerDelegate {
    func didLoadRecipe(_ coctailManager: CoctailManager, coctailRecipe: CoctailModel)
    func didFailWithError(error: Error)
}

struct CoctailManager {
    
  
 let coctailURL = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s"
 
    var delegate: CoctailManagerDelegate?
    
    func getCoctail(coctailName: String) {
        
        let urlString = "\(coctailURL)=\(coctailName)"
       
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
      
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {(data, responce, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    print(error!)
                    return
                    
                }
                if let safeData = data {
                    if let coctailRecipe = self.parseJSON(safeData) {
                        
                        self.delegate?.didLoadRecipe(self, coctailRecipe: coctailRecipe)
                    }
                    
                    
                }
               
            }
            task.resume()
        }
    }
    
    func parseJSON(_ coctailData: Data) -> CoctailModel? {
   
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoctailData.self, from: coctailData)
           
            let drinkName = decodedData.drinks[0].strDrink!
    
            let coctailRecipe = CoctailModel(coctailName: drinkName)
           
            print(coctailRecipe.coctailName)
            return coctailRecipe
            
        } catch {
            delegate?.didFailWithError(error: error)
        return nil
           
        }
    }
}
