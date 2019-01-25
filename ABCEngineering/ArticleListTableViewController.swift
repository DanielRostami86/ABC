//
//  ArticleListTableViewController.swift
//  ABCEngineering
//
//  Created by Arun Sinthanaisirrpi on 15/1/19.
//  Copyright © 2019 Australian Broadcasting Corporation. All rights reserved.
//

import UIKit

class ArticleListTableViewController: UITableViewController {
    
    var articles = [cellArticlesViewModel]()
    var error: Error?
    var selectedIndex = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(refreshControlValueChanged), for: .valueChanged)
        let nib = UINib(nibName: "ArticleTableViewCell", bundle: Bundle.main)
        self.tableView.register(nib, forCellReuseIdentifier:"reuseIdentifierA" )
        load()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func load() {
        self.tableView.refreshControl?.beginRefreshing()
        ArticleLoader.shared.load { articles, error in
            if let uArticles = articles {
                
                self.articles = uArticles.map({return cellArticlesViewModel(data: $0)})
//                self.articles = uArticles
                self.refreshControl?.endRefreshing()
                self.tableView.reloadData()
            } else {
                // error not handled in this exercise
                fatalError()
            }
        }
    }
    
    @objc func refreshControlValueChanged() {
        guard let refreshControl = refreshControl, refreshControl.isRefreshing else { return }
        load()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifierA", for: indexPath) as? ArticleTableViewCell else {
            fatalError()
        }

        // Configure the cell...

        cell.articleViewModel = articles[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedIndex = indexPath.row
        self.performSegue(withIdentifier: "safari", sender: nil)
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let dest: safariViewController = segue.destination as! safariViewController
        dest.href = articles[selectedIndex].href
    }

}
