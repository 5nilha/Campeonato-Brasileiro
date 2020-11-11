//
//  CampeonatoBrasileiroHelper.swift
//  Brasileirao
//
//  Created by Fabio Quintanilha on 11/9/20.
//  Copyright © 2020 Fabio Quintanilha. All rights reserved.
//

import UIKit

protocol CampeonatoBrasileiroDelegate: AnyObject {
    func didUpdate()
}

final class CampeonatoBrasileiroHelper {
    
    public private (set) var campeonatoBrasileiroViewModel: CampeonatoBrasileiroViewModel?
    weak var delegate: CampeonatoBrasileiroDelegate?
    
    func downloadTeamImage(url: URL, completion: @escaping (UIImage?) -> Void) {
        Utils.instance.startLoading()
        APIHandler.fetchImage(url) { (teamImage) in
            Utils.instance.stopLoading()
            completion(nil)
        }
    }
    
    
    
    func getCampeonatoBrasileiroInformation() {
        Utils.instance.startLoading()
        let campeonatoBrasileiroService = CampeonatoBrasileiroService()
        campeonatoBrasileiroService.fetchLeagueData { [weak self] (result) in
            Utils.instance.stopLoading()
            switch result {
            case .success(let campeonatoBrasileiro):
                self?.campeonatoBrasileiroViewModel = CampeonatoBrasileiroViewModel(campeonatoBrasileiro: campeonatoBrasileiro)
                self?.delegate?.didUpdate()
            case .failure(let error):
                //TODO: handle error
                break
            }
        }
    }
    
}
