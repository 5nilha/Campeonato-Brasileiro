//
//  Utils.swift
//  Brasileirao
//
//  Created by Fabio Quintanilha on 11/8/20.
//  Copyright © 2020 Fabio Quintanilha. All rights reserved.
//

import UIKit

class Utils {
    static var instance = Utils()
    
    weak var delegate: UtilsDelegates?
    
    func showErrorAlert(title: String?, body: String?) {
        let alertController = UIAlertController(title: title, message: body, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok_action", style: .cancel, handler: nil)
        alertController.addAction(action)
        self.delegate?.presentAlert(alertController)
    }
    
    func startLoading() {
        //TODO: Start a loading spinner here
    }
    
    func stopLoading() {
        //TODO: Start a loading spinner here
    }
}
