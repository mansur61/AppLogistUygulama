//
//  TumUrunlerGoster.swift
//  AppLogistMulakat
//
//  Created by Mansur Emin  Kaya on 11.01.2021.
//  Copyright © 2021 Mansur Emin  Kaya. All rights reserved.
//

import Foundation


protocol TumUrunlerDelegate {
    func getTumUrunler(getUrunler:[TumUrunler])
}
extension TumUrunlerDelegate{
    func getTumUrunler(getUrunler:[TumUrunler]){}
}

class TumUrunlerGoster: NSObject{
    
    var delegate:TumUrunlerDelegate?
    
    
    func yukleTumUrunleri()
       {
           
           let session = URLSession.shared
           
           // sorguUrl = "{\"json\":{\"emailAddress\":\""+emailAddress+"\",\"firstName\":\""+firstName+"\",\"lastName\":\""+lastName+"\",\"publicProfileUrl\":\""+publicProfileUrl+"\",\"authId\":\""+authId+"\"}}"
     
           var request = URLRequest(url: URL(string: "https://desolate-shelf-18786.herokuapp.com/list")!)
           request.addValue("application/json", forHTTPHeaderField: "Content-Type")
           request.httpMethod = "GET"
           
           let dataTask = session.dataTask(with: request) { (data, response, error) in
               
            print("data :> \(data!)")
               let decoder = JSONDecoder()
               
               do{
                   let urunlerArray = try decoder.decode([TumUrunler].self, from: data!)
                    self.delegate?.getTumUrunler(getUrunler: urunlerArray)
               }
               catch{
                   print("Ürünler Getirilemedi.")
               }
               
           }
           
           dataTask.resume()
       }
   
    
    
}
