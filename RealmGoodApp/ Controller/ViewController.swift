//
//  ViewController.swift
//  RealmGoodApp
//
//  Created by UrataHiroki on 2021/08/03.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    let realmCRUDModel = RealmCRUDModel()
    
    let cellContentsArray = ["1","2","3","4","5","6","7","8","9","10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    

}

extension ViewController:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 77
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cellContentsArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let cellContentsLabel = cell.contentView.viewWithTag(1) as! UILabel
        let cellHeartImage = cell.contentView.viewWithTag(2) as! UIImageView
        
        cellContentsLabel.text = cellContentsArray[indexPath.row]
        cellHeartImage.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(goodOrNoGood)))
        
        return cell
    }
     
    //未完成
    @objc func goodOrNoGood(sender:UIImageView){
        
        if sender.image == UIImage(systemName: "heart"){
            
            //realmCRUDModel.createGoodRealm(goodLabel: cellContentsArray[sender.tag])
            sender.image = UIImage(systemName: "heart.fill")
            
        }else{
            
            //realmCRUDModel.upDateRealm(selectCell: )
            sender.image = UIImage(systemName: "heart")
        }
        
    }
    
    
    
    
    
}
