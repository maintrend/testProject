//
//  ArticleCell.swift
//  testProject
//
//  Created by talgat on 7/28/21.
//

import UIKit

class ArticleCell: UITableViewCell {
    
    @IBOutlet weak var coverView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(from article: Article) {
        titleLabel.text = article.title ?? ""
        DispatchQueue.global().async {
            guard let photoPath = article.urlToImage else {return}
            guard let imageURL = URL(string: photoPath) else {return}
            guard let imageData = try? Data(contentsOf: imageURL) else {return}
            
            DispatchQueue.main.async {
                self.coverView.image = UIImage(data: imageData)
            }
        }
    }
}
