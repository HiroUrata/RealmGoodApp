//
//  GoodListViewController.swift
//  RealmGoodApp
//
//  Created by UrataHiroki on 2021/08/06.
//

import UIKit

class GoodListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let realmCRUDModel = RealmCRUDModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        realmCRUDModel.filterReadGoodRealm()
        tableView.reloadData()
        
    }
    
    
   

}

extension GoodListViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 81
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return realmCRUDModel.realmGoodArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let goodListLabel = cell.contentView.viewWithTag(1) as! UILabel
        
        goodListLabel.text = realmCRUDModel.realmGoodArray[indexPath.row]
        
        return cell
        
    }
    
    
    
    
}
