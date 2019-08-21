//
//  EpisodeViewCell.swift
//  rickmorty
//
//  Created by Usuario on 14/08/2019.
//  Copyright © 2019 Antonio. All rights reserved.
//

import UIKit

class EpisodeViewCell: UITableViewCell {

    @IBOutlet weak var episodeCodeCell: UILabel!
    @IBOutlet weak var episodeNameCell: UILabel!
    @IBOutlet weak var airDateCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configureEpisode(for episodeInfo: Episode) {
        self.episodeCodeCell.text = episodeInfo.episodeCode
        self.episodeNameCell.text = episodeInfo.namee
        self.airDateCell.text = episodeInfo.airDate
    }
}
