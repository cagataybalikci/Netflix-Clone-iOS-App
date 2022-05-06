//
//  UpcomingViewController.swift
//  NetflixClone
//
//  Created by Çağatay Balıkçı on 3.05.2022.
//

import UIKit

class UpcomingViewController: UIViewController {
    
    
    //MARK: Variables
    private var titles: [Title] = [Title]()
    
    
    //MARK: TableView
    private let upcomingTable : UITableView = {
       let table = UITableView()
        table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifer)
       return table
    }()

    
    //MARK: VDL
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Upcoming"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        view.addSubview(upcomingTable)
        upcomingTable.delegate = self
        upcomingTable.dataSource = self
        
        fetchUpcoming()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        upcomingTable.frame = view.bounds
    }
    

    //MARK: Fetch Data to Upcoming Tableview
    private func fetchUpcoming(){
        APICaller.shared.getUpcomingMovie { [weak self] results in
            switch results{
            case .success(let titles):
                self?.titles = titles
                DispatchQueue.main.async {
                    self?.upcomingTable.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
   

}

//MARK: Extensions

extension UpcomingViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifer, for: indexPath) as? TitleTableViewCell else {return UITableViewCell()}
        let titles = titles[indexPath.row]
        cell.configure(with: TitleViewModel(titleName: (titles.original_title ?? titles.original_name) ?? "Unknown title name", posterURL: titles.poster_path ?? ""))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
}
