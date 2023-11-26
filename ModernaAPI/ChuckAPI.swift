//
//  ChuckAPI.swift
//  ModernaAPI
//
//  Created by BillU on 2023-11-26.
//

import Foundation

struct ChuckJoke : Codable {
    var id : String
    var url : String
    var value : String
}

struct searchresult : Codable {
    var total : Int
    var result : [ChuckJoke]
}

class ChuckAPI : ObservableObject {
    
    @Published var joketext = ""
    
    func loadapi() async {
        let url = URL(string: "https://api.chucknorris.io/jokes/random")!
        
        do {
            var (apidata, apiresp) = try await URLSession.shared.data(from: url)
            
            print(apidata.count)
            
            let decoder = JSONDecoder()
            
            var thejoke = try decoder.decode(ChuckJoke.self, from: apidata)
            
            print(thejoke.value)
            
            DispatchQueue.main.async {
                self.joketext = thejoke.value
            }
            
            
        } catch {
            print("Fel vid hämta")
        }
        
        
    }
}
