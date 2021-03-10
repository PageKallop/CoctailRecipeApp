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
            let instructions = decodedData.drinks[0].strInstructions
            let glass = decodedData.drinks[0].strGlass
            //creates ingredient array
            let ingredient = [decodedData.drinks[0].strIngredient1, decodedData.drinks[0].strIngredient2, decodedData.drinks[0].strIngredient3, decodedData.drinks[0].strIngredient4, decodedData.drinks[0].strIngredient5, decodedData.drinks[0].strIngredient6, decodedData.drinks[0].strIngredient7, decodedData.drinks[0].strIngredient8, decodedData.drinks[0].strIngredient9, decodedData.drinks[0].strIngredient10, decodedData.drinks[0].strIngredient11, decodedData.drinks[0].strIngredient12, decodedData.drinks[0].strIngredient13, decodedData.drinks[0].strIngredient14, decodedData.drinks[0].strIngredient15]
            //creates measurement array
            let measurements =  [decodedData.drinks[0].strMeasure1, decodedData.drinks[0].strMeasure2, decodedData.drinks[0].strMeasure3, decodedData.drinks[0].strMeasure4, decodedData.drinks[0].strMeasure5, decodedData.drinks[0].strMeasure6, decodedData.drinks[0].strMeasure7, decodedData.drinks[0].strMeasure8, decodedData.drinks[0].strMeasure9, decodedData.drinks[0].strMeasure10, decodedData.drinks[0].strMeasure11, decodedData.drinks[0].strMeasure12, decodedData.drinks[0].strMeasure13, decodedData.drinks[0].strMeasure14, decodedData.drinks[0].strMeasure15]
            let vertical = measurements.map { "\($0)" }.joined(separator: "\n")
        
            let coctailRecipe = CoctailModel(coctailName: drinkName, instructions: instructions, ingredient: ingredient, measurements: measurements, glassType: glass)
         
            print(vertical)
            print(coctailRecipe.coctailName)
            return coctailRecipe
            
        } catch {
            delegate?.didFailWithError(error: error)
        return nil
           
        }
    }
}
