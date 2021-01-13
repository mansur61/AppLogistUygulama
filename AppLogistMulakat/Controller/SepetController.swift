//
//  SepetController.swift
//  AppLogistMulakat
//
//  Created by Mansur Emin  Kaya on 9.01.2021.
//  Copyright © 2021 Mansur Emin  Kaya. All rights reserved.
//

import UIKit
var toplamUrunler:Int = 0;
class SepetController: UIViewController {

    
    @IBOutlet weak var toplamFiyat: UILabel!
    @IBOutlet weak var SepetTableView: UITableView!
    var topla:Float  = 0.0
    var sayac:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SepetTableView.delegate = self
        SepetTableView.dataSource = self
        // Do any additional setup after loading the view.
        toplamUrunler = urunName.count
        print("toplamUrunler :",toplamUrunler)
        
        
    }
    
    @IBAction func silSepetBtn(_ sender: Any) {
        dicDizi = [:]
        
         toplamFiyat.text = "Toplam: 0.0"
        DispatchQueue.main.async {
            self.SepetTableView.reloadData()
        }
        
        
    }
    @IBAction func quit(_ sender: Any) {
        dismissThisController()
    }
    
    @IBAction func sepetOnay(_ sender: Any) {
        alertMesaj(title:"Sepet Onay",description:"Sepet Onaylandı")
    }
    
    func alertMesaj(title:String,description:String){
       let alert = UIAlertController(title: title, message: description, preferredStyle: UIAlertController.Style.alert)
       alert.addAction(UIAlertAction(title: "TAMAM", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func dismissThisController()
    {
    
        performSegue(withIdentifier: "cikis", sender: nil)
        /*
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            self.dismiss(animated: true, completion: {})
        }
         */
    }
    
    
    @objc func artıTappedButon(_ sender: UIButton){
        
        sayac = sayac + 1
        if dicDizi.count != 0 {
           
            if sayac <= (urunStock[sender.tag]){
                toplamFiyat.text = "Toplam: \(urunCurrency[sender.tag]) \(Float((sayac))*( urunFiyat[sender.tag]))"
            }

        }else{
             toplamFiyat.text = "Toplam \(dicDizi["currency"]! as Any)\(0)"
        }
        DispatchQueue.main.async {
                   self.SepetTableView.reloadData()
               }
        
    }
    @objc func azaltTappedButon(_ sender: UIButton){
        
        sayac = sayac - 1
        if dicDizi.count != 0 {
           
            if sayac <= (urunStock[sender.tag]){
                toplamFiyat.text = "Toplam: \(urunCurrency[sender.tag]) \(Float((sayac))*( urunFiyat[sender.tag]))"
            }

        }else{
             toplamFiyat.text = "Toplam \(dicDizi["currency"]! as Any)\(0)"
        }
       DispatchQueue.main.async {
                  self.SepetTableView.reloadData()
              }
    }
    
    
}

extension SepetController: UITableViewDelegate,UITableViewDataSource{

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if dicDizi.count != 0{
          
            return urunName.count
            
        }else {
                alertMesaj(title:"Sepet Durum",description:"Sepet Boşaltıldı")
            return 1
        }
       
     }
     
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "sepetCell", for: indexPath) as! SepetViewCell
       

        if dicDizi.count != 0 {
            cell.urunAdi.text! = "\(urunName[indexPath.row])"
            cell.urunFiyati.text! = "\(urunCurrency[indexPath.row])\(urunFiyat[indexPath.row])"
            cell.urunResim?.image = UIImage.init(data: try! Data.init(contentsOf: URL(string: (urunImage[indexPath.row]))!))
        
            cell.urunArtir.tag = indexPath.row
            cell.urunArtir.addTarget(self, action: #selector(artıTappedButon(_:)), for: .touchUpInside)
            cell.urunAzalt?.tag = indexPath.row
            cell.urunAzalt.addTarget(self, action: #selector(azaltTappedButon(_:)), for: .touchUpInside)
            
            if sayac == 0 {
                cell.adet.text = "\(0)"
            }else{
                cell.adet.text = "\(sayac)"
            }
            
           topla = topla + urunFiyat[indexPath.row]
            
            if dicDizi.count != 0 {
                toplamFiyat.text = "Toplam: \(dicDizi["currency"]! as Any) \(topla) as Any)"
            }else{
                toplamFiyat.text = "Toplam: 0.0"
            }
            
        }else{
            cell.urunAdi.isHidden = true
            cell.urunFiyati.isHidden = true
            cell.urunResim?.isHidden = true
            cell.adet.isHidden = true
            cell.urunAzalt?.isHidden = true
            cell.urunArtir.isHidden = true
        }

        return cell
     }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 170
     }
 
    
}

