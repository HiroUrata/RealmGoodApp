//
//  RealmCRUDModel.swift
//  RealmGoodApp
//
//  Created by UrataHiroki on 2021/08/05.
//

import Foundation
import RealmSwift

class RealmCRUDModel{
    
    var realmGoodArray:[String] = []
    
}

extension RealmCRUDModel{
    
    func createGoodRealm(goodLabel:String){
        
        do{
            let realm = try Realm()
            let realmDatasModel = RealmDatasModel()
            
            realmDatasModel.realmGoodLabel = goodLabel
            realmDatasModel.realmGoodJudge = "good"
            
            try realm.write({
                
                realm.add(realmDatasModel)
                
            })
            
        }catch{
            
            //エラー処理など
            
        }
        
    }
    
}


extension RealmCRUDModel{
    
    func filterReadGoodRealm(){
        
        do{
            
            let realm = try Realm()
            realmGoodArray = []
            
            realm.objects(RealmDatasModel.self).filter("realmGoodJudge = good").forEach({
                
                realmGoodArray.append($0.realmGoodLabel)
                
            })
            
            
        }catch{
            
            
            
        }
        
    }
    
}


extension RealmCRUDModel{
    
    func upDateRealm(selectCell:Int){
        
        do{
           let realm = try Realm()
           
            try realm.write({
                
                realm.objects(RealmDatasModel.self)[selectCell].realmGoodJudge = "noGood"
                
            })
            
            
        }catch{
            
            
            
        }
        
    }
    
}
