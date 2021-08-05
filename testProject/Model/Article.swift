//
//  Article.swift
//  testProject
//
//  Created by talgat on 7/28/21.
//

import UIKit

class Article: NSObject, Codable, NSCoding {
    let author: String?
    let title: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    
    enum CodingKeys: String, CodingKey {
            
        case author = "author"
        case title = "title"
        case urlToImage = "urlToImage"
        case publishedAt = "publishedAt"
        case content = "content"
            
        }
    
    init(author: String?, title: String?, urlToImage: String?, publishedAt: String?, content: String?) {
        self.author = author
        self.title = title
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.content = content
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(author, forKey: "author")
        coder.encode(title, forKey: "title")
        coder.encode(urlToImage, forKey: "urlToImage")
        coder.encode(publishedAt, forKey: "publishedAt")
        coder.encode(content, forKey: "content")
    }
    
    required init?(coder: NSCoder) {
        author = coder.decodeObject(forKey: "author") as? String ?? ""
        title = coder.decodeObject(forKey: "title") as? String ?? ""
        urlToImage = coder.decodeObject(forKey: "urlToImage") as? String ?? ""
        publishedAt = coder.decodeObject(forKey: "publishedAt") as? String ?? ""
        content = coder.decodeObject(forKey: "content") as? String ?? ""
    }
    static func getArticles(from welcome: Welcome) -> [Article]? {
        return welcome.articles
    }
    
}
