//
//  ArticleSettings.swift
//  testProject
//
//  Created by talgat on 7/29/21.
//

import UIKit
import Foundation
final class ArticleSettings {
    
    private enum SettingsKeys: String {
        case article
    }
    
    static var article: [Article]! {
        
        get {
            guard let savedData = UserDefaults.standard.object(forKey: SettingsKeys.article.rawValue) as? Data,
                  let decodedModel = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedData) as? [Article] else { return nil }
            return decodedModel
        }
        
        set {
            
            let defaults = UserDefaults.standard
            let key = SettingsKeys.article.rawValue
            
            if let article = newValue {
               if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: article, requiringSecureCoding: false) {
                   print("value: \(article) was added to key \(key)")
                   defaults.set(savedData, forKey: key)
               } else {
                   defaults.removeObject(forKey: key)
               }
           }
        }
        
        
    }
    
   
}


