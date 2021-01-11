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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AnasayfaColection.delegate = self
        AnasayfaColection.dataSource = self
        
        tumUrunleriGetir.delegate = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
        tumUrunleriGetir.yukleTumUrunleri()
       /*
        DispatchQueue.main.async {
            self.AnasayfaColection.reloadData()
        }
         */
    }


    func getTumUrunler(getUrunler: [TumUrunler]) {
        self.urunDizi = getUrunler
    }
    

    @IBAction func sepetBtn(_ sender: Any) {
        print("geldiii..s")
    }

    @IBAction func artıButton(_ sender: UIButton) {
        
        print(sender.tag)
    }
    
    /*
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        print("seçilen \(indexPath.row)")
    }
    */
    
    
}


extension ViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"Cell",for:indexPath) as? AnasayfaCollectionViewCell
        
        
        cell?.fiyat?.text! = "10.00"
        
        return cell!
    }
    
   
}

