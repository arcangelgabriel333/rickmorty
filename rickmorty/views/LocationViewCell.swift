//
//  LocationViewCell.swift
//  rickmorty
//
//  Created by Usuario on 14/08/2019.
//  Copyright © 2019 Antonio. All rights reserved.
//

import UIKit

class LocationViewCell: UITableViewCell {
    
    @IBOutlet weak var locationNameCell: UILabel!
    @IBOutlet weak var locationTypeCell: UILabel!
    @IBOutlet weak var locationDimensionCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureLocation(for locationInfo: Location) {
        self.locationNameCell.text = locationInfo.namel
        self.locationTypeCell.text = locationInfo.type
        self.locationDimensionCell.text = locationInfo.dimension
    }
}
