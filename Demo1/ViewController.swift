//
//  ViewController.swift
//  Demo1
//
//  Created by Igor Zarubin on 04/07/2017.
//  Copyright © 2017 BTC. All rights reserved.
//

import UIKit

enum SegueIdentifier: String {
    case details = "Details"
    case feedback = "Feedback"
}

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = String(indexPath.row)
        return cell!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let id = segue.identifier,
            let sid = SegueIdentifier(rawValue: id) else {
            return
        }
        switch sid {
        case .details:
            let vc = segue.destination as! DetailViewController
            vc.text = "Item"
        default:
            break
        }
    }
}

