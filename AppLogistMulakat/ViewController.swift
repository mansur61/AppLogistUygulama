//
//  ViewController.swift
//  AppLogistMulakat
//
//  Created by Mansur Emin  Kaya on 9.01.2021.
//  Copyright © 2021 Mansur Emin  Kaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate{

    
    

    
    @IBOutlet weak var AnasayfaColection: UICollectionView!
    
    var sayac:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AnasayfaColection.delegate = self
        AnasayfaColection.dataSource = self
        
    
    }

    @IBAction func sepetBtn(_ sender: Any) {
        print("geldiii..s")
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
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"Cell",for:indexPath)
        
        
        
        
        return cell
    }
    
    
}

