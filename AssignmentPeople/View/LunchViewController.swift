//
//  LunchViewController.swift
//  AssignmentPeople
//
//  Created by Palak jain on 18/05/20.
//  Copyright © 2020 Palak jain. All rights reserved.
//

import Foundation
import UIKit

class LunchViewController: UIViewController,UITabBarControllerDelegate{
  
  //MARK: IBOutles
  @IBOutlet var colView: UICollectionView!
  var rootClass = RootModel(fromDictionary: NSDictionary() as! [String : Any])
  let presenter = ListViewControllerPresenter(apiManager: APIManager())
  let refreshControl = UIRefreshControl()
  var activityIndicator = UIActivityIndicatorView()
  
  
  override func viewDidLoad() {
    
    self.tabBarController?.delegate = self
    self.navigationController?.navigationBar.topItem?.title = "Lunch Time"
    tabBarController?.tabBar.barTintColor = .black
    tabBarController?.tabBar.isTranslucent = false
    //tabBarController.tabBarItem.selectedImage.ti
    presenter.listView = self as? ListView
    presenter.fetchDataFromAPI()
    
  }
  override func viewWillAppear(_ animated: Bool) {
   let mapBarButtonItem = UIBarButtonItem(image: UIImage(named: "map"), style: .plain, target: self, action: nil)
    self.navigationItem.setRightBarButton(mapBarButtonItem, animated: true)
   
    
  }
//  @objc func addClick(){
//    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//    let vc = storyboard.instantiateViewController(withIdentifier: "MAPViewController") as! MAPViewController
//    vc.detailObj
//    navigationController?.pushViewController(vc,animated: true)
//
//  }
  func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    
    if tabBarController.selectedIndex == 0{
    self.navigationController?.navigationBar.topItem?.title = "Lunch Time"
      
    }else{
    self.navigationController?.navigationBar.topItem?.title = ""
    

    }
    
  }
  
}

extension LunchViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return presenter.rootClass.restaurants.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! LunchCollCell
    let obj = presenter.rootClass.restaurants[indexPath.row]
    cell.lblTitle.text = obj.name
    cell.lblDesc.text = obj.category
    if obj.backgroundImageURL != nil{
           let url = URL(string: obj.backgroundImageURL)!
          APIManager().downloaded(from: url, contentMode: .scaleToFill, img: cell.img)
    }
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    let obj = presenter.rootClass.restaurants[indexPath.row]
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let vc = storyboard.instantiateViewController(withIdentifier: "MAPViewController") as! MAPViewController
    vc.detailObj = obj
    navigationController?.pushViewController(vc,animated: true)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height/3)
  }
}

extension LunchViewController: ListView {
 
  func finishLoading() {
    self.refreshControl.endRefreshing()
    self.colView.reloadData()
  }
  
  func setEmptyPeople() {
     self.colView.isHidden = true
  }
  func stopIndicator(){
    DispatchQueue.main.async {
    self.refreshControl.endRefreshing()
    self.refreshControl.isHidden = true
    
    }
  }
  func internetAlert(){
    let alert = UIAlertController(title: Constants.Alert.internetAlertTitle, message: Constants.Alert.internetAlertDesc, preferredStyle: .alert)
    let okAction = UIAlertAction(title: Constants.Alert.ok, style: .default) {
           UIAlertAction in
    DispatchQueue.main.async {
    self.stopIndicator()
    }
    }
    alert.addAction(okAction)
    self.present(alert, animated: true)
    
  }
}
