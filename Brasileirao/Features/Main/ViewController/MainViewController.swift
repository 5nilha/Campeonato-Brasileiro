//
//  MainViewController.swift
//  Brasileirao
//
//  Created by Fabio Quintanilha on 11/10/20.
//  Copyright © 2020 Fabio Quintanilha. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {
    
    @IBOutlet weak var leagueImageView: UIImageView?
    
    var segue: UIStoryboardSegue?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MainManager.shared.startObserver(on: self)
    }
    
    func updateView() {
        leagueImageView?.image = UIImage(named: "brazil_flag")
        leagueImageView?.cicle
    }
}

extension MainViewController: ControllerObserver {
    func performSegue(for vc: UIViewController) {
        //Insert a segue here
    }
}
