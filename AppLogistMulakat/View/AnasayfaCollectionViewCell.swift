//
//  AnasayfaCollectionViewCell.swift
//  AppLogistMulakat
//
//  Created by Mansur Emin  Kaya on 9.01.2021.
//  Copyright © 2021 Mansur Emin  Kaya. All rights reserved.
//

import UIKit

class AnasayfaCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var syacGoster: UILabel!
    @IBOutlet weak var resim:UIImageView?
    @IBOutlet weak var fiyat:UILabel?
     @IBOutlet weak var urunAd:UILabel?
    @IBOutlet weak var artiBtn: UIButton!
    @IBOutlet weak var eksiBtn: UIButton!
    
    
     override func awakeFromNib() {
           super.awakeFromNib()
          
           // ...
       }
    
}
