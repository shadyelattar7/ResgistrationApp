//
//  TableViewController7.swift
//  ImoiveApp
//
//  Created by Elattar on 8/1/19.
//

import UIKit

class TableViewController7: UITableViewController {

    var postes: [Poste] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        APIManager.getPostes { (error, posts) in
            if let error = error{
                self.showAlert(title: "Sorry", massage: error)
                
            }else if let posts = posts{
                self.postes = posts
                self.tableView.reloadData()
            }
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return postes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell7", for: indexPath)

        cell.textLabel?.text = postes[indexPath.row].myTitle

        return cell
    }
 
}
