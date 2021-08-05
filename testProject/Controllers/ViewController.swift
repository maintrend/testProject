//
//  ViewController.swift
//  testProject
//
//  Created by talgat on 7/27/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var articlesArray: [Article] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIManager.fetchArticle  { [self] (articles, result) in
            switch result {
            case .Success:
                guard let articles = articles else { return }
                self.articlesArray = articles
                ArticleSettings.article = articles
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .Failure:
                let alert = UIHelpers.showAlert(withTitle: "Ошибка",
                                                message: "Данные не были получены из сети",
                                                buttonTitle: "Вернуться назад",
                                                handler: { action in
                                                self.navigationController?.popViewController(animated: true)
                })

                self.present(alert, animated: true, completion: nil)
            print("No data!!!!!!")

            }
        }
        
    }
    
    func saveToUserDefaults(array: [Article]) {
        

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articlesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ArticleCell
        let article = articlesArray[indexPath.row]
        cell.configure(from: article)
        cell.coverView.contentMode = .scaleAspectFill
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            
            guard let indexPath = tableView.indexPathForSelectedRow else {
                return
            }
            
            let article = articlesArray[indexPath.row]
            let destVC = segue.destination as! DetailViewController
            destVC.articleModel = article
            destVC.arrayArticles = self.articlesArray
            
            
        }
    }

}


