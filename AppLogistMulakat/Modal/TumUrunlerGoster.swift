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
        
        let semaphore = DispatchSemaphore (value: 0)

        var request = URLRequest(url: URL(string: "https://desolate-shelf-18786.herokuapp.com/list")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
            let decoder = JSONDecoder()
            
            //print(String(data: data, encoding: .utf8)!)
            
            do{
                let urunlerArray = try decoder.decode([TumUrunler].self, from: data)
                 self.delegate?.getTumUrunler(getUrunler: urunlerArray)
            }
            catch{
                 print(String(describing: error))
            }
          
          semaphore.signal()
        }

        task.resume()
        semaphore.wait()
        
        
           /*
           let session = URLSession.shared
           
           
           var request = URLRequest(url: URL(string: "https://desolate-shelf-18786.herokuapp.com/list")!)
           request.addValue("application/json", forHTTPHeaderField: "Content-Type")
           request.httpMethod = "GET"
           
           let dataTask = session.dataTask(with: request) { (data, response, error) in
            
               guard let data = data else {
                 print(String(describing: error))
                 return
               }
                print("data :> \(data)")
               let decoder = JSONDecoder()
               
               do{
                let urunlerArray = try decoder.decode([TumUrunler].self, from: data)
                    self.delegate?.getTumUrunler(getUrunler: urunlerArray)
               }
               catch{
                   print("Ürünler Getirilemedi.")
               }
               
           }
           
           dataTask.resume()
 */
       }
   
    
    
}
