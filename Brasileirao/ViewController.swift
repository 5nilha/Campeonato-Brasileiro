//
//  ViewController.swift
//  Brasileirao
//
//  Created by Fabio Quintanilha on 11/5/20.
//  Copyright © 2020 Fabio Quintanilha. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       MainManager.shared.campeonatoBrasileiroHelper.getCampeonatoBrasileiroInformation()
    }


}

