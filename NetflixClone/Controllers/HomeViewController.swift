//
//  HomeViewController.swift
//  NetflixClone
//
//  Created by Çağatay Balıkçı on 3.05.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    //MARK: TableView Setup
    private let homeFeedTable: UITableView = {
       let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // Tableview added to the view
        view.addSubview(homeFeedTable)
        
        // Delegate and Data Source
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
    }
    

    // For giving Tableview a frame to cover whole screen
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }
    
    
    

}


//MARK: Tableview Delegate and Data Source

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Hello World"
        return cell
    }
    
}
