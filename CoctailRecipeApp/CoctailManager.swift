//
//  CoctailManager.swift
//  CoctailRecipeApp
//
//  Created by Page Kallop on 3/1/21.
//

import Foundation

struct CoctailManager {
  
    
 let coctailURL = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s"
    
    func getCoctail(coctailName: String) {
        print("getc")
        
        let urlString = "\(coctailURL)=\(coctailName)"
        performRequest(with: urlString)
        print(urlString)
    }
    
    func performRequest(with urlString: String) {
        print("per")
        if let url = URL(string: urlString) {
            let session = URLSession.shared
            let task = session.dataTask(with: url) {(data, responce, error) in
                if error != nil {
                    print(error!)
                    return
                    
                }
                if let safeData = data {
                    self.parseJSON(coctailData: safeData)
                    print(safeData)
                    
                }
               
            }
            task.resume()
        }
    }
    
    func parseJSON(coctailData: Data) {
        print("par")
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoctailData.self, from: coctailData)
            print(decodedData.drinks[0].strMeasure1 ?? "Default")
        } catch {
            print(error)
        }
    }
}
