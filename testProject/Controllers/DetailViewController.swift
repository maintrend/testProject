//
//  DetailViewController.swift
//  testProject
//
//  Created by talgat on 7/27/21.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var author: UILabel!
    
    @IBOutlet weak var data: UILabel!
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var photoView: UIImageView!
   
    var articleModel: Article? {
        didSet {
            self.myTitle = articleModel?.title ?? ""
        }
    }
    var indexArray: Int?
    var arrayArticles: [Article] = []
    var myTitle: String = ""
    var searchID: String = "" {
        didSet {
           var myIndex = searchArticleIndex(searchID: searchID, articleArray: ArticleSettings.article)

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        print("-----------------------------")
        print(ArticleSettings.article!)
        
    }
    
private func searchArticleIndex(searchID: String, articleArray: [Article]) -> Int? {
    return articleArray.firstIndex { $0.title == searchID }
  }

    
    @IBAction func shareButtonTapped(_ sender: UIBarButtonItem) {
        
        let myNewAuthor = myTitle.replacingOccurrences(of: " ", with: "")
        let linkToApp:URL = URL(string: "testProject://=\(myNewAuthor)")!

        let sharedLink:[AnyObject] = [linkToApp as AnyObject]
         
        let shareController = UIActivityViewController(activityItems: sharedLink, applicationActivities: nil)
     
        shareController.completionWithItemsHandler = {_, bool, _, _ in
            if bool {
                print(sharedLink)
            }
        }
        shareController.popoverPresentationController?.barButtonItem = sender
        shareController.popoverPresentationController?.permittedArrowDirections = .any
//        shareController.popoverPresentationController?.sourceView = self.view
        shareController.excludedActivityTypes = [UIActivity.ActivityType.postToTwitter, UIActivity.ActivityType.postToWeibo]
        present(shareController, animated: true, completion: nil)
    }
    
    func updateUI() {
        author.text = articleModel?.author ?? ""
        data.text = articleModel?.publishedAt ?? ""
        textView.text = articleModel?.content ?? ""
        DispatchQueue.global().async {
            let url = URL(string: self.articleModel?.urlToImage ?? "")
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                self.photoView.image = UIImage(data: data!)
                self.photoView.contentMode = .scaleAspectFill
            }
        }
        
    }

}
