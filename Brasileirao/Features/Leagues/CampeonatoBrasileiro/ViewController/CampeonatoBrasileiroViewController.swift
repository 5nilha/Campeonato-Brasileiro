//
//  CampeonatoBrasileiroViewController.swift
//  Brasileirao
//
//  Created by Fabio Quintanilha on 11/10/20.
//  Copyright © 2020 Fabio Quintanilha. All rights reserved.
//

import UIKit

class CampeonatoBrasileiroViewController: UIViewController {
 
    @IBOutlet weak var tableView: UITableView?
    
    let utils = Utils.instance
    private var campeonatoBrasileiroVM: CampeonatoBrasileiroViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        MainManager.shared.campeonatoBrasileiroHelper.delegate = self
        MainManager.shared.campeonatoBrasileiroHelper.getCampeonatoBrasileiroInformation()
    }
}

extension CampeonatoBrasileiroViewController: CampeonatoBrasileiroDelegate {
    func didUpdate() {
        campeonatoBrasileiroVM = MainManager.shared.campeonatoBrasileiroHelper.campeonatoBrasileiroViewModel
        tableView?.reloadData()
    }
}

extension CampeonatoBrasileiroViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return campeonatoBrasileiroVM?.numberOfTeams ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let teamStanding = campeonatoBrasileiroVM?.standingTable,
           let cell = tableView.dequeueReusableCell(withIdentifier: CampeonatoBrasileiroStandingCell.identifier, for: indexPath) as? CampeonatoBrasileiroStandingCell {
            cell.updateCell(standingInfo: teamStanding[indexPath.row])
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
