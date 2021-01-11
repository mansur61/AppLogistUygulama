//
//  TumUrunler.swift
//  AppLogistMulakat
//
//  Created by Mansur Emin  Kaya on 11.01.2021.
//  Copyright © 2021 Mansur Emin  Kaya. All rights reserved.
//

import Foundation

struct TumUrunler:Decodable{
    
    let id:String?
    let name:String?
    let price:String?
    let currency:String?
    let imageUrl:String?
    let stock:String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case price = "price"
        case currency = "currency"
        case imageUrl = "imageUrl"
        case stock = "stock"
        
    }
    
}
