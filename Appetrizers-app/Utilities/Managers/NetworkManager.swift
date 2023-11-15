//
//  NetworkManager.swift
//  Appetrizers-app
//
//  Created by Aryan Kaushik on 17/11/23.
//


import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    // full url = https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/appetizers
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    private let cache  = NSCache<NSString ,UIImage>()
    
    private init() {}
    
    func getAppetizers(completed : @escaping (Result<[Appetizer], APErrors>) -> Void){
        
        guard let url = URL(string : appetizerURL) else { // as URL from string returns a optional so need to make sure its not nill
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url:url)) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            guard let response = response as? HTTPURLResponse , response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
                
            }
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                completed(.success(decodedResponse.request))
            }catch {
                completed(.failure(.invalidData))
            }
            
        }
        task.resume()
        
        
    }
    func downloadImage(urlString : String , completed : @escaping (UIImage?) -> Void ) {
        
        let cacheKey = NSString(string : urlString)
         
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        guard let url = URL(string :urlString) else {
            completed(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url : url )) { data ,response , error in
            
            guard let data = data , let image = UIImage(data : data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()
    }
}
