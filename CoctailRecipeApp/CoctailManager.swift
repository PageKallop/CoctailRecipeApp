//
//  CoctailManager.swift
//  CoctailRecipeApp
//
//  Created by Page Kallop on 3/1/21.
//

import Foundation

struct CoctailManager {
    
 let coctailURL = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s="
    
    func getCoctail(coctail: String) {
        let urlString = "\(coctailURL)\(coctail)"
    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
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
            print(decodedData.drinks[0].strDrink)
        } catch {
            print(error)
        }
    }
}
