//
//  BaseViewController.swift
//  Brasileirao
//
//  Created by Fabio Quintanilha on 11/8/20.
//  Copyright © 2020 Fabio Quintanilha. All rights reserved.
//

import UIKit

/* Base View Controller should be used in all view controllers as a base controller. */

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Utils.instance.delegate = self
    }
}

extension BaseViewController: UtilsDelegates {
    func presentAlert(_ alertController: UIAlertController) {
        present(alertController, animated: true, completion: nil)
    }
}


