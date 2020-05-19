//
//  MAPViewController.swift
//  AssignmentPeople
//
//  Created by Palak jain on 19/05/20.
//  Copyright © 2020 Palak jain. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MAPViewController: UIViewController,CLLocationManagerDelegate {
  
  //MARK: IBOutlets
  
  @IBOutlet var lblName: UILabel!
  @IBOutlet var mapView: MKMapView!
  @IBOutlet var lblSocial: UILabel!
  @IBOutlet var lblMobile: UILabel!
  @IBOutlet var lblAddress: UILabel!
  @IBOutlet var lblCategory: UILabel!
  var detailObj = Restaurant(fromDictionary: NSDictionary() as! [String : Any])
  var location = CLLocationCoordinate2D()
  override func viewDidLoad() {
        super.viewDidLoad()
        SetData()
        
    }
  
  func SetData(){
    
    lblName.text = detailObj.name
    lblCategory.text = detailObj.category
    lblAddress.text = detailObj.location.address
    lblMobile.text = detailObj.contact.phone
    lblSocial.text = detailObj.contact.twitter

let location = CLLocationCoordinate2D(latitude: Double(detailObj.location?.lat ?? 0.0),longitude: Double(detailObj.location?.lng ?? 0.0))
    let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    let region = MKCoordinateRegion(center: location, span: span)
  mapView.setRegion(region, animated: true)
   let annotation = MKPointAnnotation()
    annotation.coordinate = location
    annotation.title = detailObj.location.city
    annotation.subtitle = detailObj.location.address
    mapView.addAnnotation(annotation)
    
  }
  
}
