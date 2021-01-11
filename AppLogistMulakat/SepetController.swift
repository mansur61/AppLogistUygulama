//
//  SepetController.swift
//  AppLogistMulakat
//
//  Created by Mansur Emin  Kaya on 9.01.2021.
//  Copyright © 2021 Mansur Emin  Kaya. All rights reserved.
//

import UIKit

class SepetController: UIViewController {

    @IBOutlet weak var SepetTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SepetTableView.delegate = self
        SepetTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func quit(_ sender: Any) {
        dismissThisController()
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension SepetController: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
         return 1
        
     }
     
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 1
     }
     
     func alertMesaj(){
        let alert = UIAlertController(title: "Herhangi bir Yazı", message: "Herhangi bir posts yok..", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "TAMAM", style: UIAlertAction.Style.default, handler: { (action) in
             alert.dismiss(animated: true, completion: nil)
             
         }))
         self.present(alert, animated: true, completion: nil)
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "sepetCell", for: indexPath) as? SepetViewCell
         
        
        return cell!
     }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 170
     }
 
    
}

