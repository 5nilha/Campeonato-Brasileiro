//
//  CampeonatoBrasileiroStandingCell.swift
//  Brasileirao
//
//  Created by Fabio Quintanilha on 11/10/20.
//  Copyright © 2020 Fabio Quintanilha. All rights reserved.
//

import UIKit

class CampeonatoBrasileiroStandingCell: UITableViewCell {
    
    static let identifier = "campeonatoBrasileiroStandingCell"
    
    @IBOutlet weak var positionLabel: UILabel?
    @IBOutlet weak var teamLabel: UILabel?
    @IBOutlet weak var pointsLabel: UILabel?
    @IBOutlet weak var gameLabel: UILabel?
    @IBOutlet weak var wonLabel: UILabel?
    @IBOutlet weak var drawLabel: UILabel?
    @IBOutlet weak var lossLabel: UILabel?
    @IBOutlet weak var overallLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCell(standingInfo: TeamStandingViewModel) {
        self.positionLabel?.text = standingInfo.position
        self.teamLabel?.text = standingInfo.team?.name
        self.pointsLabel?.text = standingInfo.points
        self.gameLabel?.text = standingInfo.matchesPlayed
        self.wonLabel?.text = standingInfo.won
        self.drawLabel?.text = standingInfo.draw
        self.lossLabel?.text = standingInfo.loss
        self.overallLabel?.text = standingInfo.overall
    }

}
