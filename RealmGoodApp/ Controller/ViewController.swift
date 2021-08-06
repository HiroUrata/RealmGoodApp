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

    @IBAction func goList(_ sender: Any) {
        
        let GoodListVC = storyboard?.instantiateViewController(identifier: "GoodListVC") as! GoodListViewController
        
        navigationController?.pushViewController(GoodListVC, animated: true)
        
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
        let cellHeartButton = cell.contentView.viewWithTag(2) as! UIButton
        
        cellContentsLabel.text = cellContentsArray[indexPath.row]
        cellHeartButton.tag = indexPath.row
        cellHeartButton.addTarget(self, action: #selector(goodOrNoGood), for: .touchDown)
        
        return cell
    }
     

    @objc func goodOrNoGood(sender:UIButton){
        
        if sender.backgroundImage(for: .normal) == UIImage(systemName: "heart"){
            
            realmCRUDModel.createGoodRealm(goodLabel: cellContentsArray[sender.tag])
            
            sender.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
            print(sender.tag)
            
        }else{
            
            realmCRUDModel.deleteRealm(selectContents: cellContentsArray[sender.tag])
            sender.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
            print(sender.tag)
        }
        
    }
    
    
    
    
    
}
