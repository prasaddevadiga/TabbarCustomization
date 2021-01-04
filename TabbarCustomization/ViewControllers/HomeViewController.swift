//
//  HomeViewController.swift
//  TabbarCustomization
//
//  Created by Prasad on 1/1/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        guard let cell = self.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? TopImageTableViewCell else {
            self.dismiss(animated: false, completion: nil)
            return
        }
        
        cell.dismissAnimation { (success) in
            self.dismiss(animated: false, completion: nil)
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TopImageTableViewCell", for: indexPath) as? TopImageTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    
}
