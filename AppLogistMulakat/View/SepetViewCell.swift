//
//  SepetViewCell.swift
//  AppLogistMulakat
//
//  Created by Mansur Emin  Kaya on 10.01.2021.
//  Copyright © 2021 Mansur Emin  Kaya. All rights reserved.
//

import UIKit

class SepetViewCell: UITableViewCell {

    @IBOutlet weak var urunArtir: UIButton!
    @IBOutlet weak var urunAzalt: UIButton!
    @IBOutlet weak var urunFiyati: UILabel!
    @IBOutlet weak var urunAdi: UILabel!
    @IBOutlet weak var urunResim: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
