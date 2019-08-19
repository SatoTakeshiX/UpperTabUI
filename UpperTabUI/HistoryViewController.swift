//
//  HistoryViewController.swift
//  UpperTabUI
//
//  Created by satoutakeshi on 2019/08/18.
//  Copyright © 2019 satoutakeshi. All rights reserved.
//

import UIKit

final class HistoryViewController: UIViewController {
    
    let artists: [String] = ["Pablo Picasso",
                                "Renoir",
                                "Leonardo da vinci"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
    }
}

extension HistoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = artists[indexPath.row]
        return cell
    }
    
    
}
