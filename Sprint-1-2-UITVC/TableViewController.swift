//
//  TableViewController.swift
//  Sprint-1-2-UITVC
//
//  Created by Ilgar Ilyasov on 10/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    // MARK: - Properties
    
    let cellIdentifier = "TableCell"
    let addSegueIdentifier = "AddButtonShowSegue"
    let cellSegueIdentifier = "CellShowSegue"

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.shared.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) else {
            fatalError("Failed cell guarantee") }
        cell.textLabel?.text = Model.shared.items[indexPath.row].title
        return cell
    }
    
    
    // MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailViewController else { fatalError("Segue destination failed")}
        guard let identifier = segue.identifier else { fatalError("No segue identifier provided")}
        
        switch identifier {
        case addSegueIdentifier:
            detailVC.indexPath = nil
        case cellSegueIdentifier:
            guard let indexPath = tableView.indexPathForSelectedRow else { fatalError("Unable to retrieve selected index path")}
            detailVC.indexPath = indexPath
        default: // Because values are string and not enumaration we need a default case
            fatalError("Unknown segue identifier: \(identifier)")
        }
    }
}

