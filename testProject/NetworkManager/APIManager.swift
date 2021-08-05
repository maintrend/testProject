//
//  APIManager.swift
//  testProject
//
//  Created by talgat on 7/27/21.
//

import UIKit

final class APIManager {
    
    let apiKey = "9262041980f24ef18bd3dfcafd151f85"
    
    static func fetchArticle(completionHandler: @escaping ([Article]?, APIResult) -> Void) {
        
        guard let url = URL(string: "https://newsapi.org/v2/everything?q=apple&from=2021-07-27&to=2021-07-27&sortBy=popularity&apiKey=9262041980f24ef18bd3dfcafd151f85") else { return }
        let urlrequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlrequest) { (data, response, error) in
            
            guard let data = data, error == nil else {
                completionHandler(nil, .Failure)
                return
            }
            
            do {
                let articlesList = try JSONDecoder().decode(Welcome.self, from: data)
                let articles = Article.getArticles(from: articlesList)
                
                guard articles != nil else {
                    completionHandler(nil, .Failure)
                    return
                }
                
                completionHandler(articles, .Success)
            } catch let error {
                completionHandler(nil, .Failure)
                print(error)
            }
            }.resume()
    }
}
