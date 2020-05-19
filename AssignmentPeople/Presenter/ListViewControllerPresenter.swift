//
//  ListViewControllerPresenter.swift
//  AssignmentPeople
//
//  Created by Palak jain on 18/05/20.
//  Copyright © 2020 Palak jain. All rights reserved.
//

import Foundation


protocol ListView: NSObjectProtocol {

  func finishLoading()
  func stopIndicator()
  func setEmptyPeople()
  func internetAlert()
}

class ListViewControllerPresenter{
  
  private let apiManager:APIManager
   weak var listView : ListView?
   var rootClass = RootModel(fromDictionary: NSDictionary() as! [String : Any])
   
   init(apiManager:APIManager) {
     self.apiManager = apiManager
   }
   
   func fetchDataFromAPI(){
     
     if NetworkManager().isConnectedToNetwork() == true{
       APIManager().makeGetCall(WSUrl: API_BASE_URL +  Constants.EndURL.facts) { (response, error) in
         self.rootClass = RootModel(fromDictionary: response as! [String : Any])
         if self.rootClass.restaurants.count == 0{
           self.listView?.setEmptyPeople()
           self.listView?.stopIndicator()
         }
         else{
           DispatchQueue.main.async {
             self.listView?.finishLoading()
             self.listView?.stopIndicator()
            
           }
           
         }
       }
     }
     else{
       DispatchQueue.main.async {
         self.listView?.stopIndicator()
         self.listView?.internetAlert()
       }
         

     }
     
   }
  
  
}
