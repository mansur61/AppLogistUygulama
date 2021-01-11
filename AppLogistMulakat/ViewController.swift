//
//  ViewController.swift
//  AppLogistMulakat
//
//  Created by Mansur Emin  Kaya on 9.01.2021.
//  Copyright © 2021 Mansur Emin  Kaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, TumUrunlerDelegate{

       
    @IBOutlet weak var AnasayfaColection: UICollectionView!
    var tumUrunleriGetir = TumUrunlerGoster()
    var urunDizi:[TumUrunler] = []
    
    var sayac:Int = 0
    
    var id:String = "1"
    var amount:String = "2"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AnasayfaColection.delegate = self
        AnasayfaColection.dataSource = self
        
        tumUrunleriGetir.delegate = self
        
        
            //let sorguUrl = "{\"products\":[{\"id\":\""+id+"\",\"amount\":\""+amount+"\"}]}"
           // print(sorguUrl)
        // let parameters = "{\n\"products\":[\n{\n\"id\":\"5f52348e21e9b0e8994df1de\",\n\"amount\":2\n},\n{\n\"id\":\"5f52348e8299dce0d0e393f8\",\n\"amount\":2\n}\n]\n}"
        // print(parameters)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        tumUrunleriGetir.yukleTumUrunleri()
       
        DispatchQueue.main.async {
            self.AnasayfaColection.reloadData()
        }
         
    }


    func getTumUrunler(getUrunler: [TumUrunler]) {
        self.urunDizi = getUrunler
        //print("urunDizi :> \(urunDizi)")
    }
    

    @IBAction func sepetBtn(_ sender: Any) {
        print("geldiii..s")
    }

    @IBAction func artıButton(_ sender: UIButton) {
        
        
        let semaphore = DispatchSemaphore (value: 0)

        let parameters = "{\n\"products\":[\n{\n\"id\":\"5f52348ee6fc340d2feb412b\",\n\"amount\":2\n},\n{\n\"id\":\"5f52348efdbe73ada0dd8255\",\n\"amount\":2\n}\n]\n}"
        
        let postData = parameters.data(using: .utf8)

        var request = URLRequest(url: URL(string: "https://desolate-shelf-18786.herokuapp.com/checkout")!,timeoutInterval: Double.infinity)
        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
          semaphore.signal()
        }

        task.resume()
        semaphore.wait()
    }
    
    
   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
          
          print("seçilen \(indexPath.row)")
   }
    
    
    
}


extension ViewController: UICollectionViewDataSource{
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return urunDizi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"Cell",for:indexPath) as! AnasayfaCollectionViewCell
        
        if let urunAdi = self.urunDizi[indexPath.row].name,
            let fiyat = self.urunDizi[indexPath.row].price ,
            let urlImage = self.urunDizi[indexPath.row].imageUrl,
            let currency = self.urunDizi[indexPath.row].currency{
           
           
           // cell.resim?.image = UIImage(systemName: urlImage)!
            cell.resim?.image = UIImage.init(data: try! Data.init(contentsOf: URL(string: (urlImage))!))
            cell.fiyat?.text! = "\(currency) \(fiyat)"
            cell.urunAd?.text! = "\(urunAdi)"
                        
       }
    
        return cell
    }
    
   
}

