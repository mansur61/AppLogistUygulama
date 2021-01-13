//
//  ViewController.swift
//  AppLogistMulakat
//
//  Created by Mansur Emin  Kaya on 9.01.2021.
//  Copyright © 2021 Mansur Emin  Kaya. All rights reserved.
//

import UIKit

var dicDizi = [String:Any]()

var urunName=[String]()
var urunFiyat=[Float]()
var urunStock=[Int]()
var urunCurrency=[String]()
var urunImage=[String]()

class ViewController: UIViewController, TumUrunlerDelegate{

       
    @IBOutlet weak var AnasayfaColection: UICollectionView!
    var tumUrunleriGetir = TumUrunlerGoster()
    var urunDizi:[TumUrunler] = []
    
    @IBOutlet weak var sepetSayacGoster: UIBarButtonItem!
    
    var sayac:Int = 0
    var ata:Int = 0
    var id:String = "1"
    var amount:String = "2"
    
     let cellView = AnasayfaCollectionViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AnasayfaColection.delegate = self
        AnasayfaColection.dataSource = self
        AnasayfaColection.isScrollEnabled = true
        tumUrunleriGetir.delegate = self
        ata = toplamUrunler
         print("toplamUrunler :",toplamUrunler)
         print("toplamUrunler  ata:",ata)
        
        
        if urunName.count != 0 || toplamUrunler != 0 {
            if(urunName.count == 0){
                sepetSayacGoster.title = "\(toplamUrunler)"
            }else{
                sepetSayacGoster.title = "\(urunName.count)"
            }
            
        }else{
             sepetSayacGoster.title = "\(urunName.count)"
        }

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
        print("geldiii..")
        performSegue(withIdentifier: "sepeteGit", sender: nil)
    }
    
    func sepeteUrunEkleme(){
        
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
   
    
   
    
    @objc func artıTappedButon(_ sender: UIButton){
        
       dicDizi = ["urunAdi" : self.urunDizi[sender.tag].name ?? String.self,
        "fiyat" : self.urunDizi[sender.tag].price ?? Float.self,
        "imageUrl" : self.urunDizi[sender.tag].imageUrl ?? String.self,
        "currency" : self.urunDizi[sender.tag].currency ?? String.self,
        "stock" : self.urunDizi[sender.tag].stock ?? Int.self
       ]
        
        urunName.append(self.urunDizi[sender.tag].name!)
        urunFiyat.append(self.urunDizi[sender.tag].price!)
        urunStock.append(self.urunDizi[sender.tag].stock!)
        urunCurrency.append(self.urunDizi[sender.tag].currency!)
        urunImage.append(self.urunDizi[sender.tag].imageUrl!)
     
 
        sayac = sayac + 1
        sepetSayacGoster.title = "\(urunName.count)"
        
        
        
        /*
        for i in 0...self.urunDizi.count{
            
         if i == sender.tag{
                
            
            sayac = sayac + 1
            if sayac < self.urunDizi[sender.tag].stock!{
                
                
                dicDizi = ["urunAdi" : self.urunDizi[sender.tag].name ?? String.self,
                 "fiyat" : self.urunDizi[sender.tag].price ?? Float.self,
                 "imageUrl" : self.urunDizi[sender.tag].imageUrl ?? String.self,
                 "currency" : self.urunDizi[sender.tag].currency ?? String.self,
                 "stock" : self.urunDizi[sender.tag].stock ?? Int.self
                ]
                
                self.sepetSayacGoster.title = "\(dicDizi.capacity / dicDizi.count)"
                print(dicDizi)
               
                alertMesaj(title:"Sepet Onay",description:"İlgili Ürün Sepete Eklendi")
            }
            else{
                 alertMesaj(title:"Stok Durumu",description:"İlgili Üründen Stokta Kalmadı")
                sayac = 0
            }
         }else{
            sayac = 0;
            continue;
            
          }
        }
         */
    }
    
    
    
    
    func alertMesaj(title:String,description:String){
          let alert = UIAlertController(title: title, message: description, preferredStyle: UIAlertController.Style.alert)
          alert.addAction(UIAlertAction(title: "TAMAM", style: UIAlertAction.Style.default, handler: { (action) in
               alert.dismiss(animated: true, completion: nil)
               
           }))
           self.present(alert, animated: true, completion: nil)
    }
    
    @objc func eksiTappedButon(_ sender: UIButton){
        //print("sender.tag eksiTappedButon :>",sender.tag)
      
         print(" eksiTappedButon :>",sender.tag)
        for i in 0...2{
            if i == sender.tag{
                sayac = sayac - 1
            }
        }
        DispatchQueue.main.async {
            self.AnasayfaColection.reloadData()
        }
    }
    

    
}


extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
     
        //print("hangiLabel :",hangiLabel)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return urunDizi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"Cell",for:indexPath) as! AnasayfaCollectionViewCell
       
        if let urunAdi = self.urunDizi[indexPath.row].name,
            let fiyat = self.urunDizi[indexPath.row].price ,
            let urlImage = self.urunDizi[indexPath.row].imageUrl,
            let currency = self.urunDizi[indexPath.row].currency{
           
           
            cell.resim?.image = UIImage.init(data: try! Data.init(contentsOf: URL(string: (urlImage))!))
            cell.fiyat?.text! = "\(currency) \(fiyat)"
            cell.urunAd?.text! = "\(urunAdi)"
            
           cell.artiBtn.tag = indexPath.row
            cell.artiBtn.addTarget(self, action: #selector(artıTappedButon(_:)), for: .touchUpInside)
            cell.eksiBtn.isHidden = true
            cell.syacGoster.isHidden = true
       }
         
      
        return cell
    }
    
   func collectionView(_ collectionView: UICollectionView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 170
    }
   
}

