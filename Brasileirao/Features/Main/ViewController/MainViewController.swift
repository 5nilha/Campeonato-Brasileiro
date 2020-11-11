//
//  MainViewController.swift
//  Brasileirao
//
//  Created by Fabio Quintanilha on 11/10/20.
//  Copyright © 2020 Fabio Quintanilha. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController, CampeonatoBrasileiroDelegate {
    
    @IBOutlet weak var leagueImageView: UIImageView?
    @IBOutlet weak var leagueLabel: UILabel?
    
    var segue: UIStoryboardSegue?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView() 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        MainManager.shared.campeonatoBrasileiroHelper.getCampeonatoBrasileiroInformation()
        MainManager.shared.campeonatoBrasileiroHelper.delegate = self
    }
    
    func updateView() {
        leagueImageView?.image = UIImage(named: "brazil_flag")
        leagueImageView?.cicle
    }
    
    func didUpdate() {
        leagueLabel?.text = MainManager.shared.campeonatoBrasileiroHelper.campeonatoBrasileiroViewModel?.name
        MainManager.shared.observer?.didNotify()
    }
}

