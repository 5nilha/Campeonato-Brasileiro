//
//  GameRoundInfoCell.swift
//  Brasileirao
//
//  Created by Fabio Quintanilha on 11/11/20.
//  Copyright © 2020 Fabio Quintanilha. All rights reserved.
//

import UIKit

class GameRoundInfoCell: UITableViewCell {
    
    static let identifier = "gameRoundInfoCell"
    
    @IBOutlet weak var gameRoundLabel: UILabel?
    @IBOutlet weak var weekDayLabel: UILabel?
    @IBOutlet weak var dateLabel: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCell(match: MatchViewModel) {
        gameRoundLabel?.text = "Rodada \(match.round)"
        weekDayLabel?.text = "Saturday"
        dateLabel?.text = match.gameDate
    }

}
