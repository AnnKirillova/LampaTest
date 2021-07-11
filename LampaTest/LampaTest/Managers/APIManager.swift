//
//  APIManager.swift
//  LampaTest
//
//  Created by Ann on 07.07.2021.
//

import Foundation



struct MoviewsResponse: Codable {
    let page: Int
    let results: [Movie]
    let total_pages: Int
    let total_results: Int
}

struct Movie: Codable {
    var adult: Bool
    
    var genre_ids: [Int]
    var id: Int
    var original_language: String
    var original_title: String
    var overview: String
    var popularity: Float
    var poster_path: String
    var release_date: String
    var title: String
    
    var vote_average: Double
    var vote_count: Int
}


class APIManager{
    
    func getMovies(completion: @escaping (_ result: MoviewsResponse) -> ()){
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=f910e2224b142497cc05444043cc8aa4")!
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if error != nil {
                print(error?.localizedDescription as Any)
                return
            }
            do{
                let dataJson = try JSONDecoder().decode(MoviewsResponse.self, from: data!)
                completion(dataJson)
            } catch let error{
                print(error.localizedDescription)
            }
        }.resume()
    }
}
