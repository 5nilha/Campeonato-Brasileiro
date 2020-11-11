//
//  CampeonatoBrasileiroMatchCell.swift
//  Brasileirao
//
//  Created by Fabio Quintanilha on 11/11/20.
//  Copyright © 2020 Fabio Quintanilha. All rights reserved.
//

import UIKit

class CampeonatoBrasileiroMatchCell: UITableViewCell {
    
    static let identifier = "campeonatoBrasileiroMatchCell"

    @IBOutlet weak var homeTeamImage: UIImageView?
    @IBOutlet weak var homeTeamName: UILabel?
    @IBOutlet weak var homeTeamScore: UITextField?
    @IBOutlet weak var awayTeamImage: UIImageView?
    @IBOutlet weak var awayTeamScore: UITextField?
    @IBOutlet weak var awayTeamName: UILabel?
    @IBOutlet weak var stadiumName: UILabel?
    @IBOutlet weak var gameTime: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCell(match: MatchViewModel) {
        homeTeamName?.text = match.homeTeam?.name
        homeTeamScore?.text = match.scoreHomeTeam
        
        awayTeamName?.text = match.awayTeam?.name
        awayTeamScore?.text = match.scoreAwayTeam
        
        stadiumName?.text = match.stadiumName
        gameTime?.text = match.gameTime
        
        if let homeTeamImageURL = match.homeTeam?.escudoUrl {
            homeTeamImage?.sd_setImage(with: homeTeamImageURL)
        }
        if let awayTeamImageURL = match.awayTeam?.escudoUrl {
            awayTeamImage?.sd_setImage(with: awayTeamImageURL)
        }
    }

}
